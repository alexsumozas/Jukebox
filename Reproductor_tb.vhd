library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Reproductor_tb is
end;

architecture bench of Reproductor_tb is

component Reproductor is   
    Port ( rst_R : in STD_LOGIC;
           enable_R : in STD_LOGIC;
           frecuencia_R: in natural;  --Frecuencia de la nota que da para el altavoz
           ganancia_R: in natural range 0 to 100 ;   --Ganancia de amplitud del "PWM"
           nota_R : out STD_LOGIC);   --Duración del periodo de la nota
end component;

  signal rst_R: STD_LOGIC := '0';
  signal enable_R: STD_LOGIC:= '1';
  signal frecuencia_R:  natural := 0;  --Frecuencia de la nota que da para el altavoz
  signal ganancia_R:  natural range 0 to 100 := 50 ;   --Ganancia de amplitud del "PWM"
  signal nota_R: STD_LOGIC;
    
begin

  -- Insert values for generic parameters !!
  uut: Reproductor port map( rst_R      => rst_r,
                            enable_r   => enable_r,
                            frecuencia_r => frecuencia_r,
                            ganancia_r =>  ganancia_R,
                            nota_r     => nota_R );
                            

  stimulus: process
  begin
  
    -- Put initialisation code here
    rst_r <= '1' after 50ms, '0' after 62 ms,
        '1' after 180ms, '0' after 198 ms;
    enable_r <= '0' after 102ms, '1' after 117 ms,
        '0' after 177ms, '1' after 191 ms;
        
    frecuencia_r <= 500 after 60ms, 100 after 110 ms,  200 after 190ms , 0 after 250ms, 1 after 300ms, 0 after 330ms;

    -- Put test bench stimulus code here

    wait;
  end process;
  
end;