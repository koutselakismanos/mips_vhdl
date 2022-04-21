----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:28:01 04/01/2022 
-- Design Name: 
-- Module Name:    instruction_memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory is
	generic(
		dimension : natural := 32
	);
    Port ( 
		address : in  STD_LOGIC_VECTOR (dimension - 1 downto 0);
      instruction : out  STD_LOGIC_VECTOR (dimension - 1 downto 0)
	);
end instruction_memory;

architecture Behavioral of instruction_memory is

file fileInstructions : text;
type vector_of_mem is array(0 to 1024) of std_logic_vector(dimension - 1 downto 0);
signal memory : vector_of_mem := (others => (others => '0'));

begin
	loadMemory : process
		variable readedLine : line;
		variable vInstruction : bit_vector(dimension - 1 downto 0) := (others => '0');
		variable instructionIndex : integer := 0;
		
		begin
			file_open(fileInstructions, "instruction.dat", read_mode);
			while not endfile(fileInstructions) loop
				readline(fileInstructions, readedLine);
				read(readedLine, vInstruction);
				memory(instructionIndex) <= to_stdlogicvector(vInstruction);
				instructionIndex := instructionIndex + 1;
			end loop;
			file_close(fileInstructions);
		wait;
	end process loadMemory;
	
	instruction <= memory(to_integer(unsigned(address(dimension - 1 downto 0))) / 4);

end Behavioral;

