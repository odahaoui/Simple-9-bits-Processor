library ieee;
use ieee.std_logic_1164.all;

entity partie3 is
	port(
			key	: in std_logic_vector(1 downto 0);
			SW		: in std_logic_vector(9 downto 0);
			LEDR	: out std_logic_vector(9 downto 0)
			);
end partie3;

architecture arch of partie3 is
	
	component processor is
		port
			(
				clock, aResetn, Run: in std_logic;
				Din: in std_logic_vector(8 downto 0);
				BusWires: buffer std_logic_vector(8 downto 0);
				Done: buffer std_logic
			);
	end component;

	component OnChip_rom IS
		PORT
			(
				address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
				clock		: IN STD_LOGIC  := '1';
				q		: OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
			);
	END component;
	
	component counter is 
		port
			(
				clock, aResetn : in  std_logic;
				count 			: out std_logic_vector(4 downto 0)
			);
	end component;
	
signal pc_counter : std_logic_vector(4 downto 0);
signal da : STD_LOGIC_VECTOR (8 DOWNTO 0);
	
begin
-- add below the architecture of the circuit
		U1: counter port map (clock=> key(0), aResetn => SW(0), count => pc_counter );
		
		U2: OnChip_rom port map (clock=> key(0), address => pc_counter, q=>da);
		
		U3: processor port map ( clock=> key(1), aResetn => SW(0), Run=> SW(9), Din => da , BusWires => LEDR(8 downto 0), Done=>LEDR(9)) ;

		
	
	
	
									
end arch;

-- Add below the VHDL description of the counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is

	port(		clock, aResetn : in  std_logic;
				count 			: out std_logic_vector(4 downto 0)
				);
end counter;


architecture arch of counter is

signal c: unsigned(4 downto 0);

begin
   
	process(clock,aResetn) 

		begin 
		
		if(aResetn='0') then
		
				c<="00000";
			
		elsif (rising_edge(clock)) then
				
				c<=c+1;
		end if;
			 
	count<=std_logic_vector(c);
	
	end process;		

end arch;





