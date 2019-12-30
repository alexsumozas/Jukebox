Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
 port(
        clk,reset:in std_logic;
        siguiente,anterior:in std_logic; --Botones de cambio de estado
        boton1,boton2:in std_logic; --Botones de entrada de money, selección de canción
        displayI,displayD: out std_logic_vector(6 DOWNTO 0); --Displays para el money
        led:out std_logic_vector(2 DOWNTO 0):="000"; --Leds de selcción de canción       
        estado:out integer:=0; -- quitar luego bro
        dinero:out integer:=0
 );
end Top;

architecture Behavioral of Top is

TYPE state_type IS(S0,S1,S2);
SIGNAL state,next_state:state_type;
SIGNAL saldo:  natural  :=0; --Más adelante se modificará para ponerlo como un vector
SIGNAL finaldecancion: std_logic :='0';
SIGNAL listacanciones:  natural RANGE 0 to 2 :=0; --Más adelante se modificará para ponerlo como un vector
SIGNAL precio: integer :=0;

BEGIN

SYNC_PROC:PROCESS(clk) --Sincronizador de estado
BEGIN
    IF rising_edge(clk)THEN
        IF(reset='1')THEN
            state<=S0;
            ELSE state<=next_state;
        END IF;
    END IF;
END PROCESS;

OUTPUT_DECODE:PROCESS(state,boton1,boton2,anterior) --Salidas del estado correspondiente
BEGIN
    CASE(state)is
        WHEN S0=>
         IF (boton1='1') THEN 
            saldo<=saldo+1;
         ELSIF (boton2='1') THEN
            saldo<=saldo+2;
         ELSIF(anterior='1')THEN
            saldo<=0;
            led<="001"; --provisional
         END IF;
           
        WHEN S1=>
         IF(boton1='1') THEN
            IF (listacanciones = 0) THEN
                    listacanciones <= 2;
            ELSE
                     listacanciones <= listacanciones -1 ;
            END IF; 
            
         ELSIF(boton2='1') THEN
            IF (listacanciones = 2) THEN
                    listacanciones <= 0;
            ELSE
                     listacanciones <= listacanciones +1 ;
            END IF; 
          END IF;
             
            CASE(listacanciones) IS
            WHEN 0=>
                    precio <= 1;                    
            WHEN 1=>
                     precio <= 2;
            WHEN OTHERS=>
                     precio <= 3;  
             END CASE;
             
          WHEN OTHERS=> --Aqui va la salida de s3 para cada listacancion
              finaldecancion <= '1' after 3000ms;
    END CASE;
    dinero<=saldo;
END PROCESS;

NEXT_STATE_DECODE:PROCESS(siguiente,anterior,finaldecancion) --Cambio de estado 
BEGIN
    
    CASE(state)is
        WHEN S0=>
            IF(siguiente= '1')THEN
                next_state<=S1;
                estado<=1;
            END IF;
        WHEN S1=>
            IF(anterior='1')THEN
                next_state<=S0;
                estado<=0;
             ELSIF(siguiente= '1') THEN
                next_state<=S2;
                estado<=2;
            END IF;
         WHEN OTHERS=> 
         IF(finaldecancion='1') THEN
            finaldecancion<='0';
            next_state<=S1;
            estado<=1;  
        END IF;
    END CASE;
    
END PROCESS;

end Behavioral;