Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
 port(
        
        reset:in std_logic :='0';
        habilit:in std_logic :='1';
        key:in natural := 1;
        frec: inout natural;
        
        nota: out STD_LOGIC
 );
end Top;



architecture Behavioral of Top is



--SIGNAL frecuencia: natural := 0 ;
SIGNAL ganancia: natural := 50;
SIGNAL enable: STD_LOGIC :='1';
SIGNAL rst: STD_LOGIC :='0';


COMPONENT Cancionero IS 
Port(      rst_C : in STD_LOGIC;
           enable_C : in STD_LOGIC;
           key_C: in natural range 1 to 3;      --selector de cancion
           frecuencia_C: out natural;
           ganancia_C: out natural := 50 );

END COMPONENT;

COMPONENT Reproductor IS 
Port(      rst_R : in STD_LOGIC;
           enable_R : in STD_LOGIC;
           frecuencia_R: in natural;  --Frecuencia de la nota que da para el altavoz
           ganancia_R: in natural range 0 to 100 ;   --Ganancia de amplitud del "PWM"
           nota_R : out STD_LOGIC );

END COMPONENT;


 BEGIN
 


Inst_Cancionero: Cancionero PORT MAP(
           rst_C => reset,
           enable_C => habilit,
           key_C => key,      --selector de cancion
           frecuencia_C => frec ,
           ganancia_C => ganancia
);

Inst_Reproductor: Reproductor PORT MAP(
           rst_R => reset,
           enable_R => habilit,
           frecuencia_R => frec ,
            ganancia_R => ganancia,
           nota_R => nota
);

END;