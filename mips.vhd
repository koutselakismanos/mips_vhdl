----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:06 03/17/2022 
-- Design Name: 
-- Module Name:    mips - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mips is
PORT(
	clk : in std_logic;
	clr : in std_logic
);
end mips; 

architecture Behavioral of mips is

component instruction_memory is
	generic(
		dimension : natural := 32
	);
	port(
		address : in  STD_LOGIC_VECTOR (dimension - 1 downto 0);
		instruction : out  STD_LOGIC_VECTOR (dimension - 1 downto 0)
	);
end component;

component program_counter is
generic(
		dimension : natural := 32
	);
port(
		clk : in std_logic;
		clr : in std_logic;
		pc_in : in  STD_LOGIC_VECTOR (dimension - 1 downto 0);
      pc_out : out  STD_LOGIC_VECTOR (dimension - 1 downto 0)
	);
end component;

  signal pc_out2 : std_logic_vector(31 downto 0);
  signal instruction2 : std_logic_vector(31 downto 0);
  signal adder_out : std_logic_vector(31 downto 0);
  
  

begin
	
	U1: program_counter port map(clk => clk, clr => clr, pc_in => adder_out, pc_out => pc_out2);
	
	U2: instruction_memory port map(address => pc_out2, instruction => instruction2);
	
	adder_out <= pc_out2 + x"00000004";
	
	

end Behavioral;

