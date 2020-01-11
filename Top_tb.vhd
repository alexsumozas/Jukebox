library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Top_tb is
end;

architecture bench of Top_tb is

  component Top
   port(
          reset:in std_logic :='0';
          habilit:in std_logic :='1';
          key:in natural ;
          frec: inout natural;
          nota: out STD_LOGIC
        
   );
  end component;

  signal reset: std_logic :='0';
  signal habilit: std_logic :='1';
  signal key: natural ;
  signal nota: STD_LOGIC :='0' ;
  signal frec: natural  ;

begin

  uut: Top port map ( reset   => reset,
                      habilit => habilit,
                      key     => key,
                      frec => frec,
                      nota    => nota );

  stimulus: process
  begin
  
    -- Put initialisation code here
    key <= 2 after 10ms, 1 after 13500ms , 3 after 20000ms , 4 after 4000ms , 5 after 60000ms , 3 after 75000ms;
    
    reset <= '1' after 18000ms, '0' after 19000 ms;

    habilit <= '0' after 11000ms, '1' after 12000 ms;



    -- Put test bench stimulus code here

    wait;
  end process;


end;