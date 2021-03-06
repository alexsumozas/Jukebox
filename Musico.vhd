library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Reproductor is
       
    Port ( rst_R : in STD_LOGIC;
           enable_R : in STD_LOGIC;
           frecuencia_R: in natural := 0;  --Frecuencia de la nota que da para el altavoz
           ganancia_R: in natural range 0 to 100 ;   --Ganancia de amplitud del "PWM"
           nota_R : out STD_LOGIC);   --Duraci�n del periodo de la nota
end Reproductor;

architecture Behavioral of Reproductor is
       
        signal note: STD_LOGIC ;
        
begin
        
        PROCESS  
            variable t: time  ;        --Semiperiodo de la onda
            variable t_on: time ;        --Semiperiodo de la onda
            variable selecc: boolean := false  ;      
        BEGIN
        
       if (rst_R='1'  or enable_R='0' or  frecuencia_R = 0  or  ganancia_R = 0) then
            note<='0';
            wait for 100 us;  --Para que no se bloquee, se detiene 100us
             
        else   
           t  := 1000ms /frecuencia_R ;        --Semiperiodo de la onda
           t_on := (1000ms * ganancia_R/100) / frecuencia_R;        --Semiperiodo de la onda
  
            if ( selecc = true )   then
                 note<='1';
                wait for t_on;
                selecc := false;
             else
                note<='0';
                 wait for (t - t_on);
                 selecc := true;
            end if;
        end if;
        
        END PROCESS;
        
        nota_R <= note;

end Behavioral;




