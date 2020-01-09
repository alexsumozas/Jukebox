library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Reproductor is
       
    Port ( rst_R : in STD_LOGIC;
           enable_R : in STD_LOGIC;
           frecuencia_R: in natural;  --Frecuencia de la nota que da para el altavoz
           ganancia_R: in natural range 0 to 100 ;   --Ganancia de amplitud del "PWM"
           nota_R : out STD_LOGIC);   --Duración del periodo de la nota
end Reproductor;

architecture Behavioral of Reproductor is
       
        signal note: STD_LOGIC ;
        constant MAX_AUX: natural := 500;
begin
        
        PROCESS  
            variable t: time  ;        --Semiperiodo de la onda
            variable t_on: time ;        --Semiperiodo de la onda
            variable auxiliar: natural range 0 to MAX_AUX :=0  ;
            
          BEGIN
             t  := 1000ms /frecuencia_R ;        --Semiperiodo de la onda
             t_on := (1000ms * ganancia_R/100) / frecuencia_R;        --Semiperiodo de la onda
  
        if (rst_R='1'  or enable_R='0') then
            note<='0';
            wait for 5ns;  --Para que no se bloquee
                
        else   
            if ( (auxiliar rem 2) = 0 )   then
                 note<='1';
                wait for t_on;
             else
                note<='0';
                 wait for (t - t_on);
            end if;
        end if;
        
        if (auxiliar < MAX_AUX) then       auxiliar := auxiliar + 1;   
        elsif (auxiliar = MAX_AUX) then    auxiliar := 0; 
        end if;  
         
        END PROCESS;
        
        nota_R <= note;

end Behavioral;




