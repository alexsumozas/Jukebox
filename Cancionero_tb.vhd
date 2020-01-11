library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Cancionero_tb is
end;

architecture bench of Cancionero_tb is

component Cancionero is
        
    Port ( rst_C : in STD_LOGIC;
           enable_C : in STD_LOGIC;
           key_c: in natural range 1 to 5 :=1;      --selector de cancion
           frecuencia_c : out natural;
           ganancia_c: out natural := 50 );   --Duración del periodo de la nota
end component;

  signal rst_C: STD_LOGIC:='0';
  signal enable_C: STD_LOGIC:='1';
  signal key_C: natural range 1 to 5 :=1;      --selector de cancion
  signal frecuencia_C: natural;
  signal ganancia_C: natural :=   50 ;

begin

  uut: Cancionero port map ( rst_C        => rst_C,
                             enable_C     => enable_C,
                             key_C       =>  key_C,
                             frecuencia_C => frecuencia_C,
                             ganancia_C   => ganancia_C );

  stimulus: process
  begin

    key_c <= 1, 2 after 3000ms, 1 after 13500ms, 3 after 20000ms, 2 after 30000ms, 3 after 40000ms, 4 after 50000ms , 2 after 60000ms,  5 after 65000ms,  2 after 70000ms;
    
    rst_C <= '1' after 18000ms, '0' after 19000 ms;

    enable_C <= '0' after 11000ms, '1' after 14000 ms;


    -- Put test bench stimulus code here

    wait;
  end process;

end;