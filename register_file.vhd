----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:11 04/20/2022 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
    Port ( clk : in  STD_LOGIC;
           read_register1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_register2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_register : in  STD_LOGIC_VECTOR (4 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           reg_write : in  STD_LOGIC;
           read_data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end register_file;

architecture Behavioral of register_file is
type vector_of_mem is array(0 to 31) of std_logic_vector(31 downto 0);
signal register_mem: vector_of_mem := (
	x"00000000", -- 0
	x"00000000", -- 1
	x"00000000", -- 2
	x"00000000", -- 3
	x"00000000", -- 4
	x"00000000", -- 5
	x"00000000", -- 6
	x"00000000", -- 7
	x"00000000", -- 8
	x"00000000", -- 9
	x"00000000", -- 10
	x"00000000", -- 11
	x"00000000", -- 12
	x"00000000", -- 13
	x"00000000", -- 14
	x"00000000", -- 15
	x"00000000", -- 16
	x"00000000", -- 17
	x"00000000", -- 18
	x"00000000", -- 19
	x"00000000", -- 20
	x"00000000", -- 21
	x"00000000", -- 22
	x"00000000", -- 23
	x"00000000", -- 24
	x"00000000", -- 25
	x"00000000", -- 26
	x"00000000", -- 27
	x"00000000", -- 28
	x"00000000", -- 29
	x"00000000", -- 30
	x"00000000" -- 31
);

begin
	read_data1 <= register_mem(to_integer(unsigned(read_register1)));
	read_data2 <= register_mem(to_integer(unsigned(read_register2)));
	
	process (reg_write, clk)
	begin
		if reg_write = '1' and write_register /= x"00000000" and rising_edge(clk) then
			register_mem(to_integer(unsigned(write_register))) <= write_data;
		end if;
	end process;

end Behavioral;

