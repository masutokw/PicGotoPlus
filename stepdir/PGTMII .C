//------------------------------------------------------------------
//pgt
//CONTROLADOR Microstepping de montura ecuatorial con steppers
//
//Autor: Angel Caparrós version Alt-Az
//Compilador Hi-Tech
//Control de motor de enfoque externo Stepper LX200
//Direccion RB0 Clock RA4
//lx200 guiado corregido.
//------------------------------------------------------------------
//#include <pic.h>
#include<xc.h>
#define  EE_WRITE  1
#define  EE_READ	0
#define  STEPS_RA 20
#define  STEPS_DEC 10
#define  BAUD_RATE_57600 0x15
#define  BAUD_RATE_38400 0x20
#define  BAUD_RATE_19200 0x40
#define  BAUD_RATE_9600 0x81
#define  PRESCALER_2 0x15// 0b00010101
#define  PRESCALER_4 0b00100101
#define  PRESCALER_8 53// 0b00100101
#define  MIDSTEP_RA  (STEPS_RA/2)-1
#define  MIDSTEP_DEC (STEPS_DEC/2)-1
#define  UNIPOLAR
//#define TUNABLE_FIX
#define RA
#ifdef RA
#define SELF_CODE 254
#define VERTICAL 0x00
#define RUN 0x01
#else
#define SELF_CODE 253
#define VERTICAL 0x01
#define RUN 0x00
#endif
#define BACKSLASH
//#define SELF_CLOCK
char static temp1;
#define NDelayUs\
	asm("\tDECFSZ _temp1,w");\
	asm("\tADDLW 0xFF");\
	asm("\tBTFSS STATUS, 2");\
	asm("\tGOTO $ - 2");
#if STEPS_RA==20    //20 msteps table
char static ra_wave[MIDSTEP_RA+2]= {0, 38, 76, 102, 127, 153, 178, 191, 220, 235,255}; // para 20 micro pasos
#else // 10 msteps tables
const  static char ra_wave[MIDSTEP_RA+2] = {0, 38,50,76,90, 102,120,127,145,153,160,178,185,191,200,220,225,230,235,249,255};
//char static ra_wave[MIDSTEP_RA+2] ={0,76,127,190,210,255};
#endif

#if STEPS_DEC==20
const	  char dec_wave[] = {0, 5, 7, 9, 11, 12, 14, 15, 17, 19, 20};
#else
const	  char dec_wave[] = {0,3,5,7,8,10};
#endif

#ifdef UNIPOLAR
const	   char     ra_step[] = {0xf1, 0xf3, 0xf2, 0xf6, 0xf4, 0xfc, 0xf8, 0xf9, 0xf1};
//const	  static char     ra_step[] = {0xf1, 0xf5, 0xf4, 0xf6, 0xf2, 0xfa, 0xf8, 0xf9, 0xf1};
#else
const  char ra_step[] = {0xfb,0xf3,0xf7,0xf6,0xfE,0xfc,0xfd,0xf9,0xfb };
#endif
const  char     dec_step[]= {0x1f,0x3f,0x2f,0x6f,0x4f,0xcf,0x8f,0x9f,0x1f};
bank1 struct
{
    unsigned ra_speeds[6];
    int dec_speeds[2];
} speeds;
//bank1 static char ra_post[4];


//volatile unsigned TMR1 @ 0x0E;
//volatile unsigned TMR0 @ 0x01;
volatile char   buffer,
         state;

bank1 static unsigned ra_speed, ra_current_speed;
bank1 static int dec_speed,
      dec_current_speed,
      temp;
//volatile  char a;
bank1 static char  select,
      index;

static signed char
dec_dir,
dire,post_ar;
static char     p,
       ra_mstp,
       send,
       sm,
       sm1,
       p1,
       dec_mstp;
bank1 static char guide,self_code;

struct
{
    long  ra_encoder_res,
          ra_enc_count,
          dec_enc_count;
    char msg;
    long time;
} count;
//bank2 static long clock;
static long  dec_goto_count,ra_goto_count, ltemp,pec;
//dec_encoder_res,


static int      dec_current_mstep_period,
       //		dec_target_mstep_period,
       dec_period_counter,
       speedbuff;
#ifdef BACKSLASH
bank1 static unsigned  int backcounter,debackcounter;
bank1 struct
{
    unsigned int debackslash,backslash;
} back;
#endif
struct
{
    unsigned ra_current_mstep_period;
    signed char vdpost,ra_dir;
} ra;
static unsigned
intbuffer;
static char    *pointer,
       *pointer2,
       ra_pwm_value,
       ra_pwm_comp,
       dm1,
       dec_pwm_value,
       T1,
       dm,
       frev;
bit             ra_slew_bit;
bit             dec_slew_bit;
//bit             ra_slew_bit_enable;
//bit             dec_slew_bit_enable;
bit             ra_slew_bit;
bit             dec_slew_bit;;
//bit             focuser_run_bit;
bit             pasAR;
volatile bit             fs;
bit 		halt;
bit led;
bit half_ra_bit;
bit high_volt_bit;
//bit half_de_bit;
bit vertical;
bit backa,backd;
bit vhigh_ra_bit;
bit pec_bit;

//static volatile bit	arbit	@(unsigned)&h*8+0
//--------------------------------------------------------------------------------
//Rutinas de grabacion y Lectura de la EEPROM interna para almacenar configuracion
//--------------------------------------------------------------------------------
void OnEEprom(char start, char size, char *address,char emode)
{
    auto char n,*point;
    point = address;
    for (n = start; n < (start + size); n++)
    {
        if (emode) EEPROM_WRITE(n, *point);
        else (*point) = EEPROM_READ(n);
        point++;
    };
}
//--------------------------------------------------------------------------------
//Procedimiento Principal
//-------------------------------------------------------------------------------
void  main(void)

{
    //auto char h;
    // Desabilita Wachtdog Timer,low voltage programming, y habilitamos High
    // Speed
//    CONFIG( HS & WDTDIS & LVPDIS & MCLRDIS & BORDIS & PWRTEN);
    GIE=0;
    //--------------------------------------------------------------------------
    // Configuracion de los registros para USART salidas
    // reset,preescaler,MRCLR...
    // Carga de matriz velocidades para LX200 desde la EEPROM.
    // Solamente se permite interrupcion de timer.
    //---------------------------------------------------------------------------

    OnEEprom(0, 20, (char *) speeds.ra_speeds,EE_READ);
    //  OnEEprom(12, 8, (char *) dec_speeds,EE_READ);
    OnEEprom(24, 12, (char *) &count,EE_READ);
#ifdef TUNABLE_FIX
    OnEEprom(48,MIDSTEP_RA+2, (char *) ra_wave,EE_READ);
#endif
    //self_code=EEPROM_READ(40);
//	vertical=EEPROM_READ(41);
    self_code=SELF_CODE;
    vertical=VERTICAL;
#ifdef BACKSLASH
    OnEEprom(42,4,(char *) &back,EE_READ);
    //	backa=EEPROM_READ(46);backd=EEPROM_READ(47);
    backa=backd=1;
#endif
    //OnEEprom(44,2,(char *) &back.backslash,EE_READ);
    ra.ra_dir=ra.vdpost=EEPROM_READ(36);
    post_ar =1;

    CMCON = 7;
    PORTA = 0;
    PORTB = 4;
    TRISA = 0x0;
    //TRISB = 0b00000010;
    TRISB = 0b00000011;// RX /RB0 INPUTs
    //OnEEprom(37, 1, (char *) &h, EE_READ);
    count.msg= EEPROM_READ(37);
    if ((count.msg==BAUD_RATE_19200) || (count.msg==BAUD_RATE_9600)) SPBRG=count.msg;
    else  SPBRG=BAUD_RATE_19200;
//  SPBRG=count.msg;
// 	SPBRG=BAUD_RATE_19200;


//SPBRG=count.msg;
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
    T0CS = 0;

    //half_ra_bit=1;
    count.msg=EEPROM_READ(38);
    if ((count.msg==PRESCALER_2) || (count.msg==PRESCALER_4)|| (count.msg==PRESCALER_8)) T1CON = count.msg;
    else T1CON=PRESCALER_2; //prevencion pics 4 mhx
    //	T1CON=0b00110101;
    PR2 = 0xff;
    //  CCPR1L = 128;
    T2CON = 0b00000100;
    //  T2CON = 0b00001100;
    //  count.msg = 44;
    count.msg =SELF_CODE;
    //CCP1CON = 0b00001100;
    CCP1CON = 0b00000000;
    INTCON = 0;
    PIR1 = 0;
    PEIE = 1;
    T0IE=0;
    TMR1IE=0;
    TMR2IE = 1;
    //  half_ra_bit=0;
    INTEDG=1;
    frev = 0xf6;
    ra.ra_current_mstep_period = speeds.ra_speeds[4];
    GIE=1;
    //RB3=1;
    //dec_current_mstep_period=dec_target_mstep_period=1000;dec_dir=1;
    do
    {
        if  (half_ra_bit )
        {
            RB3=0;
            frev = frev | 0x08;
        }
        else
        {
            RB3=1;
            frev = frev & 0xf7;
        };
        
        if ((TMR1IF) && (ra.ra_dir != 0))      // si completado periodo AR procesa
        {
            //pasAR=0;                       // siguiente paso calculo de
            // siguiente micropaso
            TMR1IF = 0;
            //TMR1ON = 0;
            TMR1 = ra.ra_current_mstep_period + TMR1;
            //TMR1ON = 1;
         if (INTF) {if (pec_bit=(ra.ra_dir==1))  pec=count.ra_enc_count ;INTF=0;} 

            if (--post_ar==0)
            {
                post_ar=ra.vdpost;
#ifdef BACKSLASH
                if (ra.ra_dir==1)
                {
                    if (backcounter==0)
                    {
                        count.ra_enc_count++;
                        if (count.ra_enc_count==count.ra_encoder_res) count.ra_enc_count=0;
                    }
                    else
                    {
                        backcounter--;
                        if (backa && !half_ra_bit)
                        {
                            TMR1=speeds.ra_speeds[1];
                            post_ar=1;
                        };
                    }
                    ra_mstp++;

                }
                else
                {
                    if (backcounter==back.backslash)
                    {
                        count.ra_enc_count--;
                        if (count.ra_enc_count<0) count.ra_enc_count=count.ra_encoder_res;
                    }
                    else
                    {
                        backcounter++;
                        if (backa && !half_ra_bit)
                        {
                            TMR1=speeds.ra_speeds[1];
                            post_ar=1;
                        };
                    };
                    ra_mstp--;
                };
#else
                if (ra.ra_dir==1)
                {
                    count.ra_enc_count++;
                    ra_mstp++;
                    if (count.ra_enc_count==count.ra_encoder_res) count.ra_enc_count=0;
                }
                else
                {
                    count.ra_enc_count--;
                    ra_mstp--;
                    if (count.ra_enc_count<0) count.ra_enc_count=count.ra_encoder_res;
                };
#endif

                //   TMR2IE = 0;
                // PORTA = 0xf0;


                switch (ra_mstp)
                {

                case STEPS_RA:        // calculo  valores para configuracion paso
                    // siguiente
                    ra_mstp = 0;
                    p += 2;
                    p &= 7;
                    sm = ra_step[p + 1];
                    sm1 = ra_step[p];
                    break;

                case (0xFF):
                    ra_mstp = STEPS_RA - 1;
                    p -= 2;
                    p &= 7;;
                    sm = ra_step[p + 1];
                    sm1 = ra_step[p + 2];

                    break;
                case MIDSTEP_RA + 1:
                    sm1 = ra_step[p + 2];

                    break;
                case MIDSTEP_RA:
                    sm1 = ra_step[p];
                    break;


                }

                if (ra_mstp > (MIDSTEP_RA + 1))
                    ra_pwm_comp = 255 - (ra_pwm_value = ra_wave[STEPS_RA - ra_mstp]);
                else
                    ra_pwm_comp = 255 - (ra_pwm_value = ra_wave[ra_mstp]);
                //test
                //	if ((ra_pwm_comp) <21  && (ra_pwm_comp>0)) ra_pwm_comp=21;
                //	if ((ra_pwm_value) <21 && (ra_pwm_value>0)) ra_pwm_value=21;


                if (ra_slew_bit)
                    if (ra_goto_count==count.ra_enc_count)      // Comprobacion si estamos haciendo
                    {
                        // GOTO  en AR y si hemos llegado al
                        // punto de parada
                        ra.ra_current_mstep_period = speeds.ra_speeds[4];   // Vuelve a Velocidad Sideral si ha
                        //vdpost=ra_post[0];                   // alcanzado destino
                        ra_slew_bit = 0;
                        if (ra.ra_current_mstep_period==0)
                            ra.ra_dir = 0;
                        else ra.ra_dir=1;
                        half_ra_bit=vhigh_ra_bit=0;
                        //		if  (half_de_bit) {RB3=1;frev = frev | 0x08;} else {RB3=0;frev = frev & 0xf7;};
                        TMR2IE=1;
                    };

                fs = 1;

                if (half_ra_bit)
                {
                    if (ra_mstp<MIDSTEP_RA+1) PORTA=sm ;
                    else PORTA=sm1;
                }

            }
        }


        if (pasAR && dec_dir)
        {
            // if (dec_current_mstep_period > dec_target_mstep_period) {dec_current_mstep_period--;};
            pasAR = 0;
            if ((dec_slew_bit)&& (dec_goto_count == count.dec_enc_count))
            {
                dec_current_mstep_period = dec_slew_bit = dec_dir =0;
                PORTB = 0x0f & frev;
            };
            dec_period_counter =0;

#ifdef BACKSLASH

            if (dec_dir==1)
            {
                if (debackcounter==0) count.dec_enc_count++;
                else debackcounter--;
                dec_mstp++;
                //	 if (dec_enc_count==dec_encoder_res) dec_enc_count=-dec_encoder_res;
            }
            else if (dec_dir==-1)
            {
                if (debackcounter==back.debackslash) count.dec_enc_count--;
                else debackcounter++;
                dec_mstp--;
            };
#else
            if (dec_dir==1)
            {
                count.dec_enc_count++;
                dec_mstp++;
                //	 if (dec_enc_count==dec_encoder_res) dec_enc_count=-dec_encoder_res;
            }
            else
            {
                count.dec_enc_count--;
                dec_mstp--;
                //       if (dec_enc_count==-dec_encoder_res) dec_enc_count=dec_encoder_res
            };
#endif

            switch (dec_mstp)
            {

            case STEPS_DEC:        // calculo  valores para configuracion paso
                // siguiente
                dec_mstp = 0;
                p1 += 2;
                p1 &= 7;
                dm = dec_step[p1 + 1];
                dm1 = dec_step[p1];
                break;

            case (0xFF):
                dec_mstp = STEPS_DEC - 1;
                p1 -= 2;
                p1 &= 7;;
                dm = dec_step[p1 + 1];
                dm1 = dec_step[p1 + 2];
                break;
            case MIDSTEP_DEC + 1:
                dm1 = dec_step[p1 + 2];
                break;
            case MIDSTEP_DEC:
                dm1 = dec_step[p1];
                break;
            }


            if (dec_mstp > (MIDSTEP_DEC + 1))
                dec_pwm_value = dec_wave[STEPS_DEC - dec_mstp];
            else
                dec_pwm_value = dec_wave[dec_mstp];

            T1 = 0x00;
//	if (half_de_bit){
//			if (dec_mstp>MIDSTEP_DEC) PORTB=dm&frev; else PORTB=dm1&frev;}

        }

        if (T0IF)
        {
#ifdef SELF_CLOCK
            count.time++;
#endif
            //	clock++;
            dec_period_counter++;//RB3=!RB3;
            pasAR = (dec_period_counter == dec_current_mstep_period);
            //TMR0=170+TMR0;
            T0IF = 0;
            RA4=1;

            if (dec_dir) //&& !(half_de_bit)) {
            {
                if (T1 == STEPS_DEC)
                    T1 = 0;

                if (T1 >=dec_pwm_value)
                    PORTB = dm1 & frev;
                else
                    PORTB = dm & frev;
                T1++;

            }

        }



#include "cparser.c"

    }
    while (1);

}
//--------------------------------------------------------------------------
//Fin de rutina principal
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
//Procedimiento de interrupcion solo responde a interrupcion de TIMER2
//
//--------------------------------------------------------------------------

static void     interrupt
isr(void)
{
    //	if (TMR2IF){
    TMR2 =TMR2IF =0;


    if (halt)
    {
        PORTA = 0xf0;
        PR2=255;
    }

    else
    {

        if (ra_pwm_value==0)
        {
            //	PORTA =sm;
            PR2=255;
            PORTA = sm1;


        }
        else if (ra_pwm_value>234)
        {
            if (ra_pwm_value!=255)
            {
                PORTA = sm1;
                temp1=(ra_pwm_comp>>1)+1;
                NDelayUs
            }
            PORTA=sm;
            TMR2 =TMR2IF =0;
            PR2 = ra_pwm_value;



        }
        else
        {
            if (fs==1)
            {
                PORTA = sm;
                PR2 =ra_pwm_value;
                fs = 0;


            }
            else
            {
                PORTA = sm1;
                PR2 = ra_pwm_comp;
                fs = 1;
            }

            // }
        }
    }
//TMR2IE = 1;
}

/*
static void     interrupt
                isr(void)
{//	if (TMR2IF){
      TMR2 =TMR2IF =0;


    if (halt)
	{
     PORTA = 0xf0;PR2=255;
    }

    else
	{

    if (ra_pwm_value == 0) {
        PORTA = sm1;
        PR2 = 255;
    } else if (ra_pwm_value == 255) {
        PORTA = sm;
        PR2 = 255;
    } else {
        if (fs==1) {
            PORTA = sm;
			PR2 =ra_pwm_value;
			fs = 0;


        } else {
            PORTA = sm1;
            PR2 = ra_pwm_comp;
			fs = 1;
        }

   // }
    }
}
//TMR2IE = 1;
}

/* Datos de configuracion EEPROM*/



__EEPROM_DATA(0x59, 0xFF, 0x06, 0xFF, 0xA0, 0x9E, 0x9F, 0x9E);
__EEPROM_DATA(0x40, 0x3D, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00);
__EEPROM_DATA(0x30, 0x00, 0x86, 0x01, 0x00, 0xEB, 0x41, 0x00);
__EEPROM_DATA(0x80, 0xF5, 0x20, 0x00, 0xC8, 0x06, 0x41, 0x00);
__EEPROM_DATA(0x25, 0x5D, 0xFF, 0xFF, 0x01,BAUD_RATE_19200,PRESCALER_2,0xFF);
__EEPROM_DATA(SELF_CODE,VERTICAL,RUN, 0x00,0x00,0x00,0xFF,0xFF);
__EEPROM_DATA( 0, 38, 76, 102, 127, 153, 178, 191);
__EEPROM_DATA( 220, 249, 255,0xFF,0xFF,0xFF,0xFF,0xFF);

