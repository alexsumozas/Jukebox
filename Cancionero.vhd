library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Cancionero is
        
    Port ( rst_C : in STD_LOGIC;
           enable_C : in STD_LOGIC;
           key_c: in natural range 1 to 5 :=1;      --selector de cancion
           frecuencia_c : out natural := 0;
           ganancia_c: out natural := 50 );   --Duración del periodo de la nota
end Cancionero;

architecture Behavioral of Cancionero is

signal duracion: time ;        --Duracion de la nota
signal frecuency: natural := 0; 
signal ganan: natural  := 50;

signal resolved_frec : std_logic :='1';

constant MAX_AUX: natural := 350;
  

TYPE NOTAS IS (MUTE, DO, DOS ,RE, RES, MI, FA, FAS, SOL, SOLS, LA, LAS, SI);
 
  function PLAY 
                (toca_nota: in NOTAS ;
                 escala: in natural range 2 to 5
                                     ) return natural is
                 variable frec: real;
                begin
                    case toca_nota is
                     when MUTE => return 0;  --Silencio, frecuencia unidad
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
                          if duracion = 0.0 then  return  0.001*negra;
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
    

    
   
BEGIN

        P1: PROCESS     
            
            variable tempo: natural;
            
            variable aux: natural range 0 to MAX_AUX :=0  ;
            variable key_ant: natural := 0;         --Para detectar cambios de canción
            BEGIN
            
            if ( key_C /= key_ant ) then       --kay'event no funcionaba
                
                key_ant := key_C; 
                case key_C is
                    when 1 =>  aux:= 0;
                    when 2 =>  aux:= 50;
                    when 3 =>  aux:= 140;
                    when 4 =>  aux:= 220;
                    when 5 =>  aux:= 260;
                    when others => aux:= 140;
                end case; 
              end if;
              
                if ( key_C = 1 and aux>=0 and aux <50) then                 --Megalomania | Undertale
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
                when 41 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(2.0, tempo);
                
                when others => frecuency<= PLAY(MUTE,3); 
                            aux := 0; --Volviendo al inicio
                            wait for TIEMPO(1.0, tempo); --Silencio de blanca al terminar la canción
                end case;
               
            elsif ( key_C = 2 and aux>=50 and aux <140 ) then  --Pokemon Rojo Fuego INTRO
                tempo:= 150;
                case aux  is
                
                when 50 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.0, tempo); 
                when 51 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);
                when 52 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo); 
                when 53 => frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                when 54 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 55 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 56 => frecuency<= PLAY(LAS,3); wait for TIEMPO(1.0, tempo);  
                when 57 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 58 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 59 => frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                when 60 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 61 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 62 => frecuency<= PLAY(DOS,3); wait for TIEMPO(1.0, tempo);  
                when 63 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 64 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 65 => frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                when 66 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 67 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 68 => frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                when 69 => frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                when 70 => frecuency<= PLAY(RE,3); wait for TIEMPO(2.0, tempo);  
                when 71 => frecuency<= PLAY(DO,4); wait for TIEMPO(2.0, tempo);  
                when 72 => frecuency<= PLAY(DO,4); wait for TIEMPO(2.0, tempo);  
                when 73 => frecuency<= PLAY(MUTE,4); wait for TIEMPO(1.0, tempo);  
                 tempo:= 120;
                when 74 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 75 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 76 => frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                when 77 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 78 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 79 => frecuency<= PLAY(LAS,3); wait for TIEMPO(1.0, tempo);  
                when 80 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 81 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.5, tempo);  
                when 82 => frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                when 83 => frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                when 84 => frecuency<= PLAY(RE,5); wait for TIEMPO(0.5, tempo);  
                when 85 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.5, tempo);
               
               --iNICIO DEL BUCLE
                when 86 => frecuency<= PLAY(SOL,2); wait for TIEMPO(0.25, tempo);  
                when 87 => frecuency<= PLAY(SI,2); wait for TIEMPO(0.25, tempo);  
                when 88 => frecuency<= PLAY(RE,3); wait for TIEMPO(0.25, tempo); 
                when 89 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.25, tempo);  
                when 90 => frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                when 91 => frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                when 92 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.0, tempo);  
                
                when 93 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.25, tempo);  
                when 94 => frecuency<= PLAY(SOL,3); wait for TIEMPO(0.25, tempo);  
                when 95 => frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                when 96 => frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                when 97 => frecuency<= PLAY(SOL,3); wait for TIEMPO(1.0, tempo);  
                when 98 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                when 99 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                when 100 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                when 101 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                when 102 => frecuency<= PLAY(FA,3); wait for TIEMPO(0.5, tempo);  
                when 103 => frecuency<= PLAY(FAS,3); wait for TIEMPO(0.5, tempo);  
                
                when 104 => frecuency<= PLAY(SOL,3); wait for TIEMPO(1.5, tempo);  
                when 105 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 106 => frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                when 107 => frecuency<= PLAY(LA,3); wait for TIEMPO(1.5, tempo);  
                when 108 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 109 => frecuency<= PLAY(FA,4); wait for TIEMPO(1.5, tempo);  
                when 110 => frecuency<= PLAY(MI,4); wait for TIEMPO(0.25, tempo);  
                when 111 => frecuency<= PLAY(RES,4); wait for TIEMPO(0.25, tempo);  
                when 112 => frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                when 113 => frecuency<= PLAY(FA,3); wait for TIEMPO(1.5, tempo);  
                when 114 => frecuency<= PLAY(MI,3); wait for TIEMPO(0.25, tempo);  
                when 115 => frecuency<= PLAY(RES,3); wait for TIEMPO(0.25, tempo);  
                when 116 => frecuency<= PLAY(RE,3); wait for TIEMPO(2.0, tempo);  
                when 117 => frecuency<= PLAY(DO,3); wait for TIEMPO(1.0, tempo);  
                when 118 => frecuency<= PLAY(SI,2); wait for TIEMPO(1.0, tempo);  
                when 119 => frecuency<= PLAY(DO,3); wait for TIEMPO(1.0, tempo);  
               
                when 120 => frecuency<= PLAY(SOL,3); wait for TIEMPO(1.5, tempo);  
                when 121 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.25, tempo);  
                when 122 => frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                when 123 => frecuency<= PLAY(LA,3); wait for TIEMPO(2.0, tempo);  
                when 124 => frecuency<= PLAY(DO,4); wait for TIEMPO(1.0, tempo);  
                when 125 => frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                when 126 => frecuency<= PLAY(DO,4); wait for TIEMPO(1.0, tempo);  
                when 127 => frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);  
                
                when 128 => frecuency<= PLAY(FA,3); wait for TIEMPO(1.0, tempo);  
                when 129 => frecuency<= PLAY(MI,3); wait for TIEMPO(1.0, tempo);  
                when 130 => frecuency<= PLAY(FA,3); wait for TIEMPO(1.0, tempo);  
                when 131 => frecuency<= PLAY(DO,3); wait for TIEMPO(1.0, tempo);  
                when 132 => frecuency<= PLAY(RE,3); wait for TIEMPO(2.0, tempo);  
                when 133 => frecuency<= PLAY(MUTE,4); wait for TIEMPO(0.5, tempo);  
                
                when 134 => frecuency<= PLAY(SI,2); wait for TIEMPO(1.0, tempo);  
                when 135 => frecuency<= PLAY(DO,3); wait for TIEMPO(1.0, tempo);  
                when 136 => frecuency<= PLAY(RE,3); wait for TIEMPO(1.0, tempo);  
                
                when others => frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.0, tempo);  
                                aux:= 85; --vuelta al inicio del bucle
                          
                end case;
             
             
            elsif ( key_C = 3 and aux>=140 and aux <220) then        --RONDO ALLA TURCA DE MOZART
                tempo:= 130; --tambien puede ser 150
                
                case aux is
                when 140 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.0, tempo);   
                when 141 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 142 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 143 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                when 144 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 145 => frecuency<= PLAY(DO,4); wait for TIEMPO(1.0, tempo);  
                
                when 146 => frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);  
                when 147 => frecuency<= PLAY(DO,4); wait for TIEMPO(0.5, tempo);  
                when 148 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 149 => frecuency<= PLAY(DO,4); wait for TIEMPO(0.5, tempo);  
                when 150 => frecuency<= PLAY(MI,4); wait for TIEMPO(1.0, tempo);  
                
                when 151 => frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);  
                when 152 => frecuency<= PLAY(MI,4); wait for TIEMPO(0.5, tempo);  
                when 153 => frecuency<= PLAY(RES,4); wait for TIEMPO(0.5, tempo);  
                when 154 => frecuency<= PLAY(MI,4); wait for TIEMPO(0.5, tempo);  
                
                when 155 => frecuency<= PLAY(SI,4); wait for TIEMPO(0.5, tempo);  
                when 156 => frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                when 157 => frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);  
                when 158 => frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                when 159 => frecuency<= PLAY(SI,4); wait for TIEMPO(0.5, tempo);  
                when 160 =>  frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                when 161 => frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);  
                when 162 => frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                when 163 => frecuency<= PLAY(DO,5); wait for TIEMPO(1.0, tempo);  
                
                when 164 => frecuency<= PLAY(SI,4); wait for TIEMPO(0.5, tempo);  
                when 165 => frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                when 166 => frecuency<= PLAY(DO,4); wait for TIEMPO(0.5, tempo);  
                when 167 => frecuency<= PLAY(SI,4); wait for TIEMPO(0.5, tempo);  
                when 168 => frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                when 169 => frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);  
                when 170 => frecuency<= PLAY(LA,4); wait for TIEMPO(0.5, tempo);  
                
                when 171 => frecuency<= PLAY(MI,4); wait for TIEMPO(0.5, tempo);  
                when 172 => frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);  
                when 173 => frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);  
                when 174 => frecuency<= PLAY(DO,4); wait for TIEMPO(1.0, tempo);  
                
                when 175 => frecuency<= PLAY(DO,4); wait for TIEMPO(0.25, tempo);  
                when 176 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.25, tempo);  
                when 177 => frecuency<= PLAY(DO,4); wait for TIEMPO(0.25, tempo);  
                when 178 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.25, tempo);  
                when 179 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.75, tempo);  
                when 180 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.5, tempo);  
                
                tempo:= 150;
                --Inicio Bucle
                
                when 181 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 182 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 183 => frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                when 184 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 185 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 186 => frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                when 187 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 188 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 189 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                when 190 => frecuency<= PLAY(FAS,3); wait for TIEMPO(0.5, tempo);  
                when 191 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                when 192 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 193 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 194 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                when 195 => frecuency<= PLAY(MI,3); wait for TIEMPO(1.5, tempo);  
                when 196 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                when 197 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 198 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 199 => frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                when 200 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 201 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 202 => frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                when 203 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 204 => frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 205 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                when 206 => frecuency<= PLAY(FAS,3); wait for TIEMPO(0.5, tempo);  
                when 207 => frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 208 => frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                when 209 => frecuency<= PLAY(MI,3); wait for TIEMPO(0.5, tempo);  
                when 210 => frecuency<= PLAY(LA,3); wait for TIEMPO(1.5, tempo);  
                when 211 => frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);
                
                when others => frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.0, tempo);    
                                aux:= 180;
                
                end case;
                
                
           elsif ( key_C = 4 and aux>=220 and aux <260) then        --WE WISH YOU A MERRY CHISTMAS

                tempo:= 130; 
                case aux is
                when 220 =>  frecuency<= PLAY(MUTE,3); wait for TIEMPO(2.0, tempo); 
                when 221 =>  frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo); 
                when 222 => frecuency<= PLAY(MI,3); wait for TIEMPO(1.0, tempo);  
                when 223 =>  frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                when 224 =>  frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 225 =>  frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 226 =>  frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 227 =>  frecuency<= PLAY(SOLS,3); wait for TIEMPO(0.5, tempo);  
                when 228 =>  frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                when 229 =>  frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                when 230 =>   frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                when 231 =>  frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                when 232 =>  frecuency<= PLAY(SI,3); wait for TIEMPO(1.0, tempo);  
                when 233 =>  frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 234 =>  frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                when 235 =>  frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 236 =>  frecuency<= PLAY(LA,3); wait for TIEMPO(0.5, tempo);  
                when 237 =>  frecuency<= PLAY(SOLS,3); wait for TIEMPO(1.0, tempo);  
                when 238 =>  frecuency<= PLAY(MI,3); wait for TIEMPO(1.0, tempo);  
                when 239=>  frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                when 240 =>  frecuency<= PLAY(MI,3); wait for TIEMPO(1.0, tempo);  
                when 241 =>  frecuency<= PLAY(DOS,4); wait for TIEMPO(1.0, tempo);  
                when 242 =>  frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                when 243 =>  frecuency<= PLAY(RE,4); wait for TIEMPO(0.5, tempo);  
                when 244 =>  frecuency<= PLAY(DOS,4); wait for TIEMPO(0.5, tempo);  
                when 245 =>  frecuency<= PLAY(SI,3); wait for TIEMPO(0.5, tempo);  
                when 246 =>  frecuency<= PLAY(LA,3); wait for TIEMPO(1.0, tempo);  
                when 247 =>  frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                when 248 =>  frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                when 249 =>  frecuency<= PLAY(MI,3); wait for TIEMPO(0.5, tempo);  
                when 250 =>  frecuency<= PLAY(MI,3); wait for TIEMPO(0.5, tempo);  
                when 251 =>  frecuency<= PLAY(FAS,3); wait for TIEMPO(1.0, tempo);  
                when 252 =>  frecuency<= PLAY(SI,3); wait for TIEMPO(1.0, tempo);  
                when 253 =>  frecuency<= PLAY(SOLS,3); wait for TIEMPO(1.0, tempo);  
                when 254 =>  frecuency<= PLAY(LA,3); wait for TIEMPO(2.5, tempo);  
                when 255 =>  frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.25, tempo);  
                
                when others =>  frecuency<= PLAY(MUTE,3); wait for TIEMPO(0.0, tempo);  
                                aux:=220;
                
                end case;
                
                elsif ( key_C = 5 and aux>=260 and aux <320) then    --5a de Beethoven
                tempo:= 160;
                
                case aux is
                when 260 =>  frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.5, tempo);
                when 261 =>  frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                when 262 =>  frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                when 263 =>  frecuency<= PLAY(SOL,3); wait for TIEMPO(0.5, tempo);
                when 264 =>  frecuency<= PLAY(RES,4); wait for TIEMPO(2.0, tempo);
                when 265 =>  frecuency<= PLAY(MUTE,4); wait for TIEMPO(4.5, tempo);
                when 266 =>  frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                when 267 =>  frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                when 268 =>  frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);

                when 269 =>  frecuency<= PLAY(RE,4); wait for TIEMPO(2.0, tempo);
                when 270 =>  frecuency<= PLAY(MUTE,4); wait for TIEMPO(4.5, tempo);
                when 271 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 272 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 273 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 274 =>  frecuency<= PLAY(RES,4); wait for TIEMPO(0.5, tempo);
                when 275 =>  frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);
                when 276 =>  frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);
                when 277 =>  frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);
                when 278 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 279 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 280 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 281 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 282 =>  frecuency<= PLAY(DO,4); wait for TIEMPO(1.5, tempo);
                when 283 =>  frecuency<= PLAY(MUTE,4); wait for TIEMPO(1.0, tempo);

                when 284 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 285 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 286 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 287 =>  frecuency<= PLAY(SOLS,4); wait for TIEMPO(0.5, tempo);
                when 288 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 289 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 290 =>  frecuency<= PLAY(SOL,4); wait for TIEMPO(0.5, tempo);
                when 291 =>  frecuency<= PLAY(MUTE,4); wait for TIEMPO(0.5, tempo);
                when 292 =>  frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                when 293 =>  frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                when 294 =>  frecuency<= PLAY(FA,4); wait for TIEMPO(0.5, tempo);
                when 295 =>  frecuency<= PLAY(RE,5); wait for TIEMPO(1.5, tempo);
                when 296 =>  frecuency<= PLAY(MUTE,4); wait for TIEMPO(1.0, tempo);
                when 297 =>  frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                when 298 =>  frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                when 299 =>  frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                when 300 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 301 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 302 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 303 =>  frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                when 304 =>  frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                when 305 =>  frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                when 306 =>  frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                when 307 =>  frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                
                when 308 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 309 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 310 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(0.5, tempo);
                when 311 =>  frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                when 312 =>  frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                when 313 =>  frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                when 314 =>  frecuency<= PLAY(SOL,5); wait for TIEMPO(0.5, tempo);
                when 315 =>  frecuency<= PLAY(FA,5); wait for TIEMPO(0.5, tempo);
                when 316 =>  frecuency<= PLAY(RES,5); wait for TIEMPO(2.0, tempo);
                when 317 =>  frecuency<= PLAY(DO,5); wait for TIEMPO(2.0, tempo);
                when 318 =>  frecuency<= PLAY(RES,4); wait for TIEMPO(4.0, tempo);
                
                when others =>  frecuency<= PLAY(MUTE,4); wait for TIEMPO(2.0, tempo);
                                aux:= 260;
                
                end case;
            
                else    frecuency<= PLAY(MUTE,3); wait for TIEMPO(1.0, 60); 
                
            
            end if;  --Fin de las canciones
            
     
                if (aux = MAX_AUX) then    aux := 0; 
                else    aux := aux + 1;   --Por desbordamiento
                 END IF;
                 
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
              
frecuencia_C <= frecuency when resolved_frec ='1'  else  0;  
             --Pone la frecuencia a 0 (Mantiene callado si se pulsa reset o disable).
ganancia_C<=ganan;

end Behavioral;

