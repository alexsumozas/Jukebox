Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
 port(
        clk,reset:in std_logic;
        siguiente,anterior:in std_logic; --Botones de cambio de estado
        boton1, boton2:in std_logic; --Botones de entrada de money, selección de canción
        displayI: out std_logic_vector(6 DOWNTO 0):="1111111"; --Displays para el money
        led_song:out std_logic_vector(2 DOWNTO 0):="000"; --Leds de selcción de canción    
        led_est:out std_logic_vector(2 DOWNTO 0):="000";   
        led_dev : out std_logic :='0';
        
        --estado:out integer range 0 TO 2 :=0;
        --dinero: inout natural range 0 TO 9 :=0 ;
        --precio_out: inout integer range 0 TO 9 :=0;
  
        controlI: out std_logic_vector(3 DOWNTO 0);
        --clk_output: out std_logic;
        
        nota: out STD_LOGIC
       
 );
end Top;



architecture Behavioral of Top is

SIGNAL dinero: natural range 0 TO 9 :=0 ;
shared variable seleccionI: std_logic_vector(3 DOWNTO 0):="0111";
--shared variable seleccionD: std_logic_vector(3 DOWNTO 0):="0001";
SIGNAL botones: std_logic_vector (4 DOWNTO 0); 
signal clk_out: std_logic:='0';

SIGNAL key: natural := 0 ;
SIGNAL frecuencia: natural := 0 ;
SIGNAL ganancia: natural := 50;
SIGNAL enable: STD_LOGIC :='0';

COMPONENT Div_frec is
  Port ( CLK: IN STD_LOGIC;
         RESET: IN STD_LOGIC;
         CLK_OUT: OUT STD_LOGIC );
end COMPONENT;

COMPONENT EntradasLimpias is
 port(
        clock,reset:in std_logic;
        siguiente,anterior:in std_logic; --Botones de cambio de estado
        boton1, boton2:in std_logic; --Botones de entrada de money, selección de canción
        led:out std_logic_vector(5-1 DOWNTO 0):="00000" --Leds de selcción de canción       
 );
 end COMPONENT;
 
COMPONENT MaquinaEstados is
 port(
        clk,reset:in std_logic;
        siguiente,anterior:in std_logic; --Botones de cambio de estado
        boton1,boton2:in std_logic; --Botones de entrada de money, selección de canción
        led_song:out std_logic_vector(2 DOWNTO 0):="000"; --Leds de selcción de canción    
        led_est:out std_logic_vector(2 DOWNTO 0):="000";   
        led_dev : out std_logic :='0';
        --precio_out: inout integer range 0 TO 9 :=0;
        key_M: out natural:=0;
        habilit_M: out std_logic :='0';
        --estado:out integer range 0 TO 2 :=0;
        dinero: inout natural range 0 TO 9 :=0
 );
end COMPONENT;

COMPONENT  Decoder IS
PORT (
code : IN integer range 0 TO 9;
led : OUT std_logic_vector(6 DOWNTO 0)
);
END COMPONENT;

COMPONENT sinc is
 Port (
 sync_in: IN STD_LOGIC;
 clk: IN STD_LOGIC;
 sync_out: OUT STD_LOGIC
 );
end COMPONENT;


COMPONENT Debouncer IS
port (
clk : in std_logic;
rst : in std_logic;
btn_in : in std_logic;
btn_out : out std_logic);
END COMPONENT;

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
 
 Inst_Divisorfrec: Div_frec PORT MAP (
         CLK => clk,
         RESET => '0',
         CLK_OUT => clk_out
 );
--  Inst_Divisorfrec2: Div_frec PORT MAP (
--         CLK => clk,
--         RESET => '0',
--         CLK_OUT => clk_output
-- );
 Inst_EntradasLimpias: EntradasLimpias port map (
        clock=>clk,
        reset=>reset,
        siguiente=>siguiente,
        anterior=>anterior, --Botones de cambio de estado
        boton1=>boton1,
        boton2=>boton2, --Botones de entrada de money, selección de canción
        led=>botones --Leds de selcción de canción       
 );
 
 Inst_MaquinaEstados: MaquinaEstados port map (
 clk => clk_out,
 reset => botones(4),
 siguiente => botones(2),
 anterior => botones(3),
 boton1=> botones(0),
 boton2=>botones(1),
 led_song=> led_song,
 led_est=>led_est,
 led_dev=>led_dev,
-- precio_out=> precio_out,
-- estado => estado,
 key_M=>key,
 habilit_M => enable,
 dinero => dinero
);

controlI <= seleccionI;
--controlD <= seleccionD;

Inst_decoderI: decoder PORT MAP (
code => dinero,
led =>displayI
);

--Inst_decoderD: decoder PORT MAP (
--code => precio_out,
--led =>displayD
--);

Inst_Cancionero: Cancionero PORT MAP(
           rst_C => botones(4),
           enable_C => enable,
           key_C => key,      --selector de cancion
           frecuencia_C => frecuencia,
           ganancia_C => ganancia
);

Inst_Reproductor: Reproductor PORT MAP(
           rst_R => botones(4),
           enable_R => enable,
           frecuencia_R => frecuencia,
            ganancia_R => ganancia,
           nota_R => nota
);

END;