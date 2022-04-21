----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:04:32 04/20/2022 
-- Design Name: 
-- Module Name:    alu_control - Behavioral 
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

entity alu_control is
    Port ( alu_op : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           op : out  STD_LOGIC_VECTOR (2 downto 0));
end alu_control;


architecture Behavioral of alu_control is
begin
	process (op_code) is
	begin
		case alu_op is
			when "00" =>
				op <= "010";
			when "X1" =>
				op <= "110";
			when "1X" =>
				case funct(3 downto 0) is
					when "0000" =>
						op <= "010";
					when "0010" =>
						op <= "110";
					when "0100" =>
						op <= "000";
					when "0101" =>
						op <= "001";
					when "1010" =>
						op <= "111";
				end case;
		end case;
	end process;


end Behavioral;

