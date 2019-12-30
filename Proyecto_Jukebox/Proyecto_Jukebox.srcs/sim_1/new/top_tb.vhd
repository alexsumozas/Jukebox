library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Top_tb is
end;

architecture bench of Top_tb is

  component Top
   port(
          clk,reset:in std_logic;
          siguiente,anterior:in std_logic;
          boton1,boton2:in std_logic;
          displayI,displayD: out std_logic_vector(6 DOWNTO 0);
          led:out std_logic_vector(2 DOWNTO 0):="000";
          estado: out integer:=0;
          dinero:out integer:=0
   );
  end component;

  signal clk: std_logic:='0';
  signal reset: std_logic:='0';
  signal siguiente,anterior: std_logic := '0';
  signal boton1,boton2: std_logic:='0';
  signal displayI,displayD: std_logic_vector(6 DOWNTO 0);
  signal led: std_logic_vector(2 DOWNTO 0):="000" ;
  signal estado: integer:=0;
  signal dinero: integer:=0;
  
begin

  uut: Top port map ( clk       => clk,
                      reset     => reset,
                      siguiente => siguiente,
                      anterior  => anterior,
                      boton1    => boton1,
                      boton2    => boton2,
                      displayI  => displayI,
                      displayD  => displayD,
                      led       => led,
                      estado    => estado,
                      dinero    => dinero
                        );
  stimulus: process
  begin
    -- Put initialisation code here
    boton1<='1' after 50ns, '0' after 100ns, '1' after 350ns, '0' after 400ns;
    boton2<='1' after 150ns, '0'after 200ns, '1' after 450ns, '0'after 500ns;
    anterior<='1' after 640ns, '0' after 665ns, '1' after 800ns, '0' after 900ns,'1' after 965ns, '0' after 1010ns ;
    siguiente<='1' after 550ns, '0' after 600ns, '1' after 700ns, '0' after 750ns, '1' after 950ns, '0' after 1000ns;
    -- Put test bench stimulus code here


    wait;
  end process;

  clocking: process
  begin
    clk<=not clk;
    wait for 30ns;

  end process;

end;