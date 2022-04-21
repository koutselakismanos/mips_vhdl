----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:37 04/01/2022 
-- Design Name: 
-- Module Name:    program_counter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_counter is
	generic(
		dimension : natural := 32
	);
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (dimension - 1 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (dimension - 1 downto 0));
end program_counter;

architecture Behavioral of program_counter is

begin
process (clr, clk) begin
	if (clr = '1') then pc_out <= (others => '0');
	elsif (clk'EVENT and clk='1') then pc_out <= pc_in;
	end if;
end process;


end Behavioral;

