library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Cancionero is
        
    Port ( rst_C : in STD_LOGIC;
           enable_C : in STD_LOGIC;
           key_c: in natural range 1 to 5;      --selector de cancion
           frecuencia_c : out natural;
           ganancia_c: out natural := 50 );   --Duración del periodo de la nota
end Cancionero;

architecture Behavioral of Cancionero is

signal duracion: time;        --Duracion de la nota
signal frecuency: natural := 1; 
signal ganan: natural  := 50;

signal resolved_frec : std_logic :='1';

constant MAX_AUX: natural := 5000;
  

TYPE NOTAS IS (MUTE, DO, DOS ,RE, RES, MI, FA, FAS, SOL, SOLS, LA, LAS, SI);
 
  function PLAY 
                (toca_nota: in NOTAS ;
                 escala: in natural range 2 to 5
                                     ) return natural is
                 variable frec: real;
                begin
                    case toca_nota is
                     when MUTE => return 1;  --Silencio, frecuencia unidad
                     when DO => frec:= 32.7032;  --Nota DO
                     when DOS => frec:= 34.6479;  --Nota DO SOSTENIDO
                     when RE => frec:=36.7081;  --Nota RE
                     when RES => frec:=38.8909;  
                     when MI => frec:=41.2035;  
                     when FA => frec:= 43.6536; 
                     when FAS => frec:= 46.2493; 
                     when SOL => frec:= 48.9995; 
                     when SOLS => frec:= 51.9130; 
                     when LA => frec:= 55.0000;  
                     when LAS => frec:= 58.2705;  
                     when SI => frec:= 61.7354;  
                   
                     when OTHERS=> frec:= frec;
  
                  end case; 
                              
       FOR i in 1 to escala LOOP  --- No estoy seguro si i empieza en 0 o 1
       
            frec:= 2.0*frec;
            
            end loop;   
            
            return natural(frec);
    END function PLAY;
    
 function TIEMPO
                (duracion: in real;
                 bpm: in natural 
                                     ) return time is    
                                     
                  variable negra: time := (1000ms * 60) / bpm;                     
                begin
                          if duracion = 0.0 then  return  0.05*negra;
                       elsif duracion = 0.25 then  return negra*duracion;
                       elsif duracion = 0.50 then  return negra*duracion;
                       elsif duracion = 0.75 then  return negra*duracion;
                       elsif duracion = 1.0 then  return  negra*duracion;
                       elsif duracion = 1.25 then  return negra*duracion;
                       elsif duracion = 1.50 then  return negra*duracion;
                       elsif duracion = 1.75 then  return negra*duracion;
                       elsif duracion = 2.0 then  return negra*duracion;
                       elsif duracion = 2.25 then  return negra*duracion;
                       elsif duracion = 2.50 then  return negra*duracion;
                       else return negra*duracion;
            end if;
    END function TIEMPO;
    
    function REPRODUCE
                (duracion: in real;
                 bpm: in natural 
                                     ) return time is    
                                     
                  variable negra: time := (1000ms * 60) / bpm;                     
                begin
                          if duracion = 0.0 then  return  0.05*negra;
                       elsif duracion = 0.25 then  return negra*duracion;
                       elsif duracion = 0.50 then  return negra*duracion;
                       elsif duracion = 0.75 then  return negra*duracion;
                       elsif duracion = 1.0 then  return  negra*duracion;
                       elsif duracion = 1.25 then  return negra*duracion;
                       elsif duracion = 1.50 then  return negra*duracion;
                       elsif duracion = 1.75 then  return negra*duracion;
                       elsif duracion = 2.0 then  return negra*duracion;
                       elsif duracion = 2.25 then  return negra*duracion;
                       elsif duracion = 2.50 then  return negra*duracion;
                       else return negra*duracion;
            end if;
            
            --                 while (contador < duracion) loop
--                      if rising_edge( CLOCK ) then contador:= contador+5ns; 
                        --elsif if (rst='1'  or enable='0') then habilit<='0';
                        --end if;
--                 end loop;   
    END function REPRODUCE;
    
    
   
BEGIN

        P1: PROCESS     
            
            variable tempo: natural;
            
            variable aux: natural range 0 to MAX_AUX :=0  ;
            BEGIN
                 
          if ( key_C = 1 ) then                 --Megalomania | Undertale
                tempo:= 120;
                case aux  is
                
                when 0 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.0, tempo);  --Silencio inicial
                when 1 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.25, tempo);
                when 2 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.25, tempo);
                when 3 => frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);
                when 4 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);
                when 5 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);
                when 6 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                when 7 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);
                when 8 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.25, tempo);
                when 9 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.25, tempo);
                when 10 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.25, tempo);
                when 11 => frecuency<= PLAY(DO,3); wait for TIEMPO(0.25, tempo);
                when 12 => frecuency<= PLAY(DO,3); wait for TIEMPO(0.25, tempo);
                when 13 => frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);
                when 14 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);
                when 15 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);
                when 16 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                when 17 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);
                when 18 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.25, tempo);
                when 19 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.25, tempo);
                when 20 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.25, tempo);
                when 21 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.25, tempo);
                when 22 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.25, tempo);
                when 23 => frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);
                when 24 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);
                when 25 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);
                when 26 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                when 27 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);
                when 28 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.25, tempo);
                when 29 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.25, tempo);
                when 30 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.25, tempo);
                when 31 => frecuency<= PLAY(LAS,3); wait for TIEMPO(0.25, tempo);
                when 32 => frecuency<= PLAY(LAS,3); wait for TIEMPO(0.25, tempo);
                when 33 => frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);
                when 34 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);
                when 35 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);
                when 36 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                when 37 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);
                when 38 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.25, tempo);
                when 39 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.25, tempo);
                when 40 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.25, tempo);
                
                when others => frecuency<= PLAY(MUTE,3); 
                            aux := 0; --Volviendo al inicio
                            wait for TIEMPO(2.0, tempo); --Silencio de blanca al terminar la canción
                end case;
               
            elsif ( key_C = 2 ) then  --Pokemon Rojo Fuego INTRO
                tempo:= 150;
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(2.0, tempo); 
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo); 
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LAS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(MUTE,4); wait for TIEMPO(1.0, tempo);  
                 tempo:= 120;
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LAS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(RE,5); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.5, tempo);
                
                FOR I IN 0 TO 3 LOOP
                frecuency<= PLAY(SOL,2); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(SI,2); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(0.25, tempo); 
                frecuency<= PLAY(FA,3); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.0, tempo);  
                
                frecuency<= PLAY(SOL,3); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(SOL,3); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FAS,3); wait for TIEMPO(0.5, tempo);  
                
                frecuency<= PLAY(SOL,3); wait for TIEMPO(1.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FA,4); wait for TIEMPO(1.5, tempo);  
                frecuency<= PLAY(MI,4); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(RES,4); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(FA,3); wait for TIEMPO(1.5, tempo);  
                frecuency<= PLAY(MI,3); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(RES,3); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(DO,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(SI,2); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(DO,3); wait for TIEMPO(1.0, tempo);  
               
                frecuency<= PLAY(SOL,3); wait for TIEMPO(1.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                
                frecuency<= PLAY(FA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(MI,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(FA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(DO,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(MUTE,4); wait for TIEMPO(0.5, tempo);  
                
                frecuency<= PLAY(SI,2); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(DO,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(RE,3); wait for TIEMPO(1.0, tempo);  
                
                END LOOP;
             
             
            elsif ( key_C = 3 ) then        --RONDO ALLA TURCA DE MOZART
                tempo:= 130; --tambien puede ser 150
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.0, tempo);  
                
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(1.0, tempo);  
                
                frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(MI,4); wait for TIEMPO(1.0, tempo);  
                
                frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(MI,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RES,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(MI,4); wait for TIEMPO(0.5, tempo);  
                
                frecuency<= PLAY(SI,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,4); wait for TIEMPO(0.5, tempo);  
                 frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DO,5); wait for TIEMPO(1.0, tempo);  
                
                frecuency<= PLAY(SI,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                
                frecuency<= PLAY(MI,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(1.0, tempo);  
                
                frecuency<= PLAY(DO,4); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(DO,4); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.25, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.75, tempo);  
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.5, tempo);  
                
                tempo:= 150;
                FOR I IN 1 TO 2 LOOP
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FAS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(MI,3); wait for TIEMPO(1.5, tempo);  
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FAS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(MI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.5, tempo);  
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                END LOOP;
                
           elsif ( key_C = 4 ) then        --WE WISH YOU A MERRY CHISTMAS
   
                FOR i IN 0 TO 3 LOOP
                tempo:= 100+25*i;  --Se va acelerando
                 frecuency<= PLAY(MUTE,3); wait for TIEMPO(2.0, tempo);  
                frecuency<= PLAY(MI,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                 frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(MI,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                frecuency<= PLAY(MI,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                frecuency<= PLAY(MI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(MI,3); wait for TIEMPO(0.5, tempo);  
                frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(SI,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(SOLS,3); wait for TIEMPO(1.0, tempo);  
                frecuency<= PLAY(LA,3); wait for TIEMPO(2.5, tempo);  
                frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                end LOOP;
                
                
                elsif ( key_C = 5) then    --5a de Beethoven
                tempo:= 160;

                frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.5, tempo);
                frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,4); wait for TIEMPO(2.0, tempo);
                frecuency<= PLAY(MUTE,4); wait for TIEMPO(4.5, tempo);
                frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);

                frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);
                frecuency<= PLAY(MUTE,4); wait for TIEMPO(4.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(DO,4); wait for TIEMPO(1.5, tempo);
                frecuency<= PLAY(MUTE,4); wait for TIEMPO(1.0, tempo);

                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(MUTE,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RE,5); wait for TIEMPO(1.5, tempo);
                frecuency<= PLAY(MUTE,4); wait for TIEMPO(1.0, tempo);
                frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                frecuency<= PLAY(RES,5); wait for TIEMPO(2.0, tempo);
                frecuency<= PLAY(DO,5); wait for TIEMPO(2.0, tempo);
                frecuency<= PLAY(RES,4); wait for TIEMPO(4.0, tempo);
                
            end if;  --Fin de las canciones
            
        if (aux < MAX_AUX) then       aux := aux + 1;   
        elsif (aux = MAX_AUX) then    aux := 0; 
        end if;    
                 
        END PROCESS P1;
  
  
       P2: PROCESS(enable_C, rst_C)
            
            BEGIN
            
                if (rst_C='1'  or enable_C='0') then
                    resolved_frec  <= '0';
                    ganan <= 0; 
                else
                    resolved_frec  <= '1';
                    ganan <= 50; 
                end if;
            
            END PROCESS P2;
              
frecuencia_C <= frecuency when resolved_frec ='1'  else  1;
ganancia_C<=ganan;

end Behavioral;

