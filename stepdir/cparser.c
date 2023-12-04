// Maquina de estado finito parseo y ejecución comandos  USART .
// No se atienden las interrupcionesde USART
// La frecuencia de interrupcion del Timer es suficiente y se
// mantiene la temporización
// Solo se procesa un byte  como máximo por transición
// IninByte ID  Command	Parameter
// 0 			0 		(#int) 		velocidad en AR
// 0 			1 				 	devuelve posicionAR posicionDEC
// 0 			2  		(#int) 		velocidad dec
// 0 			3  		(#long int) parada  en contador DEC (GOTO)
// 0 			4 		(#long int) parada  en contador AR(GOTO)
// 0 			5 		(#int) 	salva posicion
// 0 			6 					Invertir secuencia motor declinacion para cambio de orientacion
// 0 			7 					Secuencia original  secuencia motor declinacion
// 0 			8 		(#char#char)Cambio de valor de micro paso
// 0 			9 		(#int#char) Cambio de velocidad base para marchas LX200
// 0 			10 					Escribe en EEPROM matriz de velocidades
// 0			14		(long int) Graba EEPROM Resolucion encoder AR
// 0			15		(#long int) Graba EEPROM resolucion encoder
// 0			16		long int graba park declinacion
// DEc
// Comandos LX200  para autoguia aceptados #M (n s e w), #Q (n s e
// w), #R (G S M C)
// Comandos LX200 para enfoque aceptados #F+ #F- #FF #FS #FQ

#define CMD_FCODE 239
#define SELECT_STATE 252
#define CHECK_STATE 253
#define M1_SPEED_SET_CMD 0
#define COUNTERS_GET_CMD  1
#define M2_SPEED_SET_CMD  27
#define M2_SET_CMD_TARGET  3
#define  M1_SET_CMD_TARGET  4
#define  COUNTERS_SAVE_CMD  5
#define  M2_SET_BACKSLASH_CMD 6
#define  M1_SET_BACKSLASH_CMD 7
#define  M1_CHANGE_PMW_CMD 8
#define  SPEED_TABLE_CHANGE_CMD 9
#define  SPEED_TABLE_SAVE_CMD 10
#define  M1_BACKSLASH_MODE  12
#define  M2_BACKSLASH_MODE  13
#define  LED_HALF_CMD 11
#define  M1_MAX_COUNT_SAVE_CMD 14
#define  M2_MAX_COUNT_SAVE_CMD 15
#define  M1_COUNTER_SET_CMD 16
#define  M2_COUNTER_SET_CMD 17
#define  M1_STARTUP_UNSET_CMD 18
#define  M1_STARTUP_SET_CMD 19
#define  BAUDRATE_SET 20
#define  PRESCALER_SET 21
#define  PWM_FREQ_SET 24
#define  PWM_CAL_SET 25
#define  M1_GET_SPEED_CMD 26
#define GET_TICKS 29


      if (RCIF) {

            buffer = RCREG;
            switch (state) {
			//Estado inicial FEM transicion byte 0 o # LX200
            case 0:
                if (buffer ==  CMD_FCODE)
                    //state++;
				   state=SELECT_STATE;
                else            // Maquina de estados se inicializa con 0 en
                                // Byte 0
                if (buffer == '#')
                    state = 8;  // Comando LX200
                break;
			//Estado1 Proceso 2 byte detecta comando
            case 1:
                select = buffer;
                state=2;
                switch (buffer) {
			//0 ID 0 velocidad motor (word,byte) 6 byte
                case M1_SPEED_SET_CMD:
                    pointer2 = (char *) &intbuffer;
                    break;
			//0 ID 1 pedir posicion 3 byte
                case COUNTERS_GET_CMD:
				case M1_GET_SPEED_CMD:
				case GET_TICKS:
                     state = 0;
                  // ltemp = count.ra_enc_count;
                  // pointer = (char *) &ltemp;
					//if (select==1) {pointer= (char *) &count.ra_enc_count ; send = 1;}
					//else  {send=10; pointer=(char*) & ra.ra_current_mstep_period;};
					switch(select){
					case COUNTERS_GET_CMD:pointer= (char *) &count.ra_enc_count ; send = 1;break;
					case M1_GET_SPEED_CMD :send=10; pointer=(char*) & ra.ra_current_mstep_period;break;
					case GET_TICKS :send=10; ltemp=count.time; pointer=(char *)&pec; break;};
                    TXREG = *pointer;
                    pointer++;
                    break;
             //0 id 2   velocidad motor auxiliar (int) 5 byte
                case M2_SPEED_SET_CMD:
                    pointer2 = (char *) &dec_current_mstep_period;
				//	pointer2 = (char *) &dec_target_mstep_period;
                    break;
			//0 ID 3 destino motor auxiliar (long) 7 byte
                case M2_SET_CMD_TARGET:
                    dec_slew_bit = 0;
                    pointer2 = (char *) &dec_goto_count;
                    break;
			//0 ID 4 destino motor (long) 7 bytes
                case M1_SET_CMD_TARGET:
                    ra_slew_bit = 0;
                    pointer2 = (char *) &ra_goto_count;
                    // pera=ra_current_mstep_period;
                    break;
			//0 ID 5 Grabar posición motor en EEprom 3 byte
                case COUNTERS_SAVE_CMD:
                 GIE=0;
				 OnEEprom(28, 8, (char *) &count.ra_enc_count,EE_WRITE);
                // OnEEprom(32, 4, (char *) &count.dec_enc_count,EE_WRITE);
				 GIE=1;
                 state=0;
                    break;
			//0 ID 6 Backslash motor auxiliar (int) 5 byte
                case M2_SET_BACKSLASH_CMD:         // backslash auxiliar
                  #ifdef BACKSLASH
					pointer2= (char *) &back.debackslash;
					debackcounter=0;
                   #endif
                    break;
			//0 ID 7 Backslash motor auxiliar (int) 5 byte
                case M1_SET_BACKSLASH_CMD:
					#ifdef BACKSLASH
                   	pointer2= (char *) &back.backslash;
                    break;
					#endif
			//0 ID 8  Valor PWM tabla micropasos (byte,byte) 5 byte
                case M1_CHANGE_PMW_CMD:
                    state = 6;
                    break;
			//0 ID 9  tabla velocidad motor.(int,byte) 6 byte
                case SPEED_TABLE_CHANGE_CMD:
                    pointer2 = (char *) &speedbuff;
                    break;
			//0	ID 10 Grabar configuración EEPROM 3 byte
                case SPEED_TABLE_SAVE_CMD:
					GIE=0;
				 	OnEEprom(0, 12, (char *) speeds.ra_speeds,EE_WRITE);
                    //OnEEprom(12, 8, (char *) dec_speeds,EE_WRITE);
                    OnEEprom(24, 4, (char *) &count.ra_encoder_res,EE_WRITE);
				//	OnEEprom(48,MIDSTEP_RA+2 , (char *) ra_wave,EE_WRITE);
	#ifdef BACKSLASH
					OnEEprom(42,4,(char *) &back.debackslash,EE_WRITE);
		#endif


                  //  OnEEprom(24, 4, (char *) &dec_encoder_res,EE_WRITE);
					GIE=1;
                    //WriteOnEEprom(28, 2, (char *) &adjust);
                    state = 0;
                    break;
			//0 ID 11  conmutacion manual medios pasos-micropasos (byte) 4 byte
                case LED_HALF_CMD:
                    state = 13;
                    break;
			//0 ID 12	 Correción activa backslash auxiliar.(byte) 4 byte
                case M1_BACKSLASH_MODE: case M2_BACKSLASH_MODE: case BAUDRATE_SET: case PRESCALER_SET:
					state=16;
                     break;
			//0 ID 13	 Correción activa backslash motor.(byte) 4 byte
                //case 13:
				//	state=16;
                //    break;
			//0 ID 14	 Resolución motor.(long) 7 byte
             //   case 14:  case 15:
             //       pointer2 = (char *) &count.ra_encoder_res;
             //       break;
			//0 ID 15	 Resolución motor.Resolución motor.(long) 7 byte
            //    	case 15:
            //        pointer2 = (char *) &count.ra_encoder_res;//was dec
            //        break;
			//0 ID 16	 posicion Motor (long) 7 byte
                case M1_MAX_COUNT_SAVE_CMD:case M2_MAX_COUNT_SAVE_CMD: case M1_COUNTER_SET_CMD: case M2_COUNTER_SET_CMD:
                    pointer2 = (char *) &ltemp;
                    break;
			//0 ID 17	 posicion auxiliar (long) 7 byte .
            //    case 17:
            //        pointer2 = (char *) &ltemp;
            //        break;
			//0 ID 18	 Desactivar motor power on .3 byte
                case M1_STARTUP_UNSET_CMD:
                EEPROM_WRITE(36,0x00);
                	state=0;
                break;
			//0 ID 19	 Activar motor power on .3 byte
                case M1_STARTUP_SET_CMD:
                EEPROM_WRITE(36,0x01);
                	state=0;
                break;
			//0 ID 20	 baudrate (byte) 4 byte
            //    case 20:
			//		state=16;
			//	break ;
			//0 ID 21	 prescaler (byte) 4 byte.
			//	case 21:
			//		state=16;
			//	break;
			//0 ID 24	Frecuencia PWM (byte) 4 byte
				 case PWM_FREQ_SET:
						pointer2 = (char *)&T2CON;
					state=3;
				break ;
			//0	ID	25 PWM para calibración (byte) 4 byte
				case PWM_CAL_SET:
					pointer2 = (char *)&ra_pwm_value;
					state=3;
				break ;
			    default:
                    state = 0;
                    break;
			//0 ID 26 as motor1 speed


                }

                break;

			//Estado 2 comienzo entrada de parametros; int long int
            case 2:
                *pointer2 = buffer;
                 pointer2++;
                 state=3;        // byte bajo  parametro
                break;

			//Estado 3 comienzo entrada de parametros; int long int

            case 3:             // byte alto parametro
                *pointer2 = buffer;
                state = 0;
                switch (select) {
                case 0:
                    state = 15;
                    break;

                case M2_SPEED_SET_CMD:
                    if (dec_current_mstep_period > 0)
                        dec_dir = 1;
                    else if (dec_current_mstep_period < 0)
                        {dec_dir = -1; dec_current_mstep_period = -dec_current_mstep_period;}
                    	else {
                        		dec_dir = 0;
                        		PORTB = 9 & frev;
                    			}
                  //  if  ((dec_current_mstep_period)> dec_speeds[1]||dec_dir==0)  half_de_bit=0;else half_de_bit=1;
			//	  if  (half_ra_bit || half_de_bit) {RB3=1;frev = frev | 0x08;} else {RB3=0;frev = frev & 0xf7;};

                    dec_period_counter = 0;

                break;

				case M2_SET_CMD_TARGET:
				case M1_SET_CMD_TARGET:
				case M1_MAX_COUNT_SAVE_CMD:
				case M2_MAX_COUNT_SAVE_CMD:
				case M1_COUNTER_SET_CMD:
				case M2_COUNTER_SET_CMD:
				state=4;
				break;

		        case  SPEED_TABLE_CHANGE_CMD:
                state = 12;
                 break;
				case PWM_CAL_SET  :
				ra_pwm_comp=255-buffer;
				//if ((ra_pwm_comp<20)&&(ra_pwm_comp!=0)) ra_pwm_comp=20 ;
				break;


              //  default:
                   // state = 4;
			//		state=0;
              //      break;
                };
                break;

            case 12:
                if (buffer < 6)
                    speeds.ra_speeds[buffer] = speedbuff;
                else
                    if (buffer <8 )speeds.dec_speeds[buffer - 6] = speedbuff;
                state = 0;
                break;
			//Estado 4 continua lectura parametro Longint
            case 4:
                pointer2++;
                *pointer2 = buffer;
                state++;
                break;
			//Estado completa  Lectura   Longint :destino AR, DEC,tick por eje...
            case 5:
                pointer2++;
                *pointer2 = buffer;
                state = 0;
                switch (select) {
                case M2_SET_CMD_TARGET:
                    dec_slew_bit = 1;
                    break;
                case M1_SET_CMD_TARGET:
                    ra_slew_bit = 1;
                    break;
				case M1_MAX_COUNT_SAVE_CMD:
				case M2_MAX_COUNT_SAVE_CMD:
                    count.ra_encoder_res = ltemp;
                    break;

                case M1_COUNTER_SET_CMD:
                    count.ra_enc_count = ltemp;
                    break;
                case M2_COUNTER_SET_CMD:
                    count.dec_enc_count = ltemp;
                    break;

                }
                break;
			//Estado 6 lectura de indice tabla PWM micropasos
            case 6:
				state=0;
				if (buffer<MIDSTEP_RA+2){ index = buffer;state=7;};
                break;

			//Estado 7 Lectura valor PWM
            case 7:
				if (buffer>20)
              //  ra_wave[index] = buffer;
                state = 0;
                break;
			//Estado 8 comienzo detección comandos basicos LX200
           case 8:

                state = 0;
                if (buffer == ':')
                    state = 9;
                if (buffer == '#')
                    state = 8;

                break;
			//Estado 9 comienzo identificacion comandos basicos LX200
            case 9:
                state = 0;
                switch (buffer) {
                case 'M':
                    ra_speed = ra_current_speed;
                    //dec_speed = dec_current_speed;
                    dire = 1;
					state = 10;;
                    break;

                case 'Q':
                    ra_speed = 0;
                   // dec_speed = 0;
                    dire = 0;
                    state = 10;
                    break;

                case 'R':
                    state = 10;
                    guide = 0;
                    break;
                case 'F':
                    state = 14;
                    break;
                }

                break;
             //Estado 10 lectura Comandos movimiento y seleccion de velocidad LX200
            case 10:
                state = 0;
				if (vertical){
								switch(buffer) {
								case 'n':buffer= 'w';
										break;
								case 's':buffer= 'e';
										break;
								case 'w':buffer= 'n';
										break;
								case 'e':buffer= 's';
										break;
							    default: break;
								}
								}

                switch (buffer) {
                case 'w':
                    if (dire == 1){halt=0;
                        ra.ra_current_mstep_period = ra_speed;}
                    else {
                        ra.ra_current_mstep_period = speeds.ra_speeds[4];
                        if (vertical)  halt=1; else dire=1;
                    }
                    ;
			//	TMR2IE=!(half_ra_bit=(ra_speed>speeds.ra_speeds[1]));
                    ra.ra_dir = dire;
					ra.vdpost=1;

                    break;

                case 'e':
                    if (dire == 1) {halt=0;
                        ra.ra_current_mstep_period = ra_speed;
                        if (guide){
                            ra.ra_current_mstep_period = speeds.ra_speeds[5];
                            if (speeds.ra_speeds[5] <= speeds.ra_speeds[4])  dire=-1;
                        }
                    } else {
                        ra.ra_current_mstep_period = speeds.ra_speeds[4];
                        if (vertical) halt=1; else dire = -1;
                    }

					//TMR2IE=!(half_ra_bit=(ra_speed>speeds.ra_speeds[1]));

                    ra.ra_dir = -dire;
				    ra.vdpost=1;
                    break;

                case 'n':
                    //dec_current_mstep_period = dec_speed;
                    //dec_period_counter = 0;
                    //dec_dir = dire;
                    //if (dire == 0)
                      //  PORTB = (9 & frev);

                    break;

                case 's':
                  //  dec_current_mstep_period = dec_speed;
                  //  dec_period_counter = 0;
                  //  dec_dir = -dire;
                  //  if (dire == 0)
                  //      PORTB = (9 & frev);

                    break;

                case 'G':
                    ra_current_speed = speeds.ra_speeds[3];
                    //dec_current_speed = dec_speeds[3];
                    guide = 1;
                    break;

                case 'S':
                    ra_current_speed = speeds.ra_speeds[0];
                    //dec_current_speed = dec_speeds[0];
                    break;

                case 'M':
                    ra_current_speed = speeds.ra_speeds[1];
                    //dec_current_speed = dec_speeds[1];
                    break;

                case 'C':
                    ra_current_speed = speeds.ra_speeds[2];
                    //dec_current_speed = dec_speeds[2];
                    break;

                default:
                    state = 0;
                    break;
                }

                break;
            case 11:
                state = 0;
                break;
			//Estado 13 conmutacion manual medios pasos ,micropasos
            case 13:
                RB3=led=(buffer<64) ;
				if (led)
				{half_ra_bit=0;//half_de_bit=0;
				//	TMR2IE=1;
					frev = frev | 0x08;
					}
				else {half_ra_bit=1;//half_de_bit=1;
					//TMR2IE=0;
						frev=frev & 0xf7;}

                state = 0;
                break;
			//Estado 14 lectura Comandos Enfoque LX200
            case 14:
                state = 0;
				if (vertical==0) {
                switch (buffer) {
                case '-':
                    dec_current_mstep_period = dec_current_speed;
                     dec_period_counter = 0;
                    dec_dir = -1;
                    break;
                case '+':
                     dec_current_mstep_period = dec_current_speed;
                     dec_period_counter = 0;
                    dec_dir = 1;
                     break;
                case 'Q':

					dec_current_speed =dec_dir=0;
					PORTB = (9 & frev);
                    break;
                case 'F':
                    //focuSpeed = hifocuSpeed
					dec_current_speed = speeds.dec_speeds[0];
                    break;
                case 'S':
                    //focuSpeed = lowfocuSpeed;
					dec_current_speed = speeds.dec_speeds[1];
                    break;
                default:
                    state = 0;
                    break;
                }
				}
                break;
		// Estado 15  lectura velocidad AR
            case 15:
                state = 0;
                ra.ra_current_mstep_period = intbuffer;
				ra.vdpost=buffer;
				if (ra.vdpost<0)
				{ra.vdpost=-ra.vdpost;
				 ra.ra_dir=-1;}
				else
					if (ra.vdpost>0)	ra.ra_dir=1;
					else ra.ra_dir=0;
                halt=(ra.ra_dir==0) && (ra.ra_current_mstep_period==0);
					if ((ra.ra_current_mstep_period>speeds.ra_speeds[1]) &&(ra.vdpost==1))
						{half_ra_bit=1;//TMR2IE=0;
						}
				 	else {half_ra_bit=0;//TMR2IE=1;
						};

			//	if  (half_ra_bit || half_de_bit) {RB3=1;frev = frev | 0x08;} else {RB3=0;frev = frev & 0xf7;};


                break;
			case 16:
				state=0;
                switch (select){
					case 12:backa=buffer	;
						break;
					case 13:backd=buffer;
					break;
					case 20 :
					EEPROM_WRITE(37,buffer);
					break;
					case 21 :
					EEPROM_WRITE(38,buffer);
					break;}
				break;
			case SELECT_STATE:

					if (buffer==self_code) state =CHECK_STATE;
					else  if (buffer!= CMD_FCODE) state=0;
				break;
			case CHECK_STATE:
					state=0;
					if (buffer==self_code) state =1;
					else { if (buffer== CMD_FCODE) state=SELECT_STATE;};
			break;

            default:
                state = 0;
                break;
            }
			 if ((OERR))
    {
      CREN = 0;
      CREN = 1;
	  //state=0;
    }
            RCIF = 0;
        }
   /*   if (TXIF)
            if ((send > 0) && (TRMT)) {
                TXREG = *pointer;
                pointer++;
				send++;
                if (send==9)  send = 0;


            };

*/
        if (TXIF)
            if ((send > 0) && (TRMT)) {
                TXREG = *pointer;
                pointer++;
                send++;
                switch (send) {
                case 4:
                    ltemp = count.dec_enc_count;
                    pointer = (char *) &ltemp;
                    break;
                case 8:
       			 case 13:
            	pointer = (char *) &count.msg;
            		if (pec_bit)
            		{   pointer++;
                		pec_bit=0;
            		}
				send=8;
 				break;
				case 9:
			    send = 0;
			    break;



                }
            };

