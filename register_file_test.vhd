--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:25:49 04/20/2022
-- Design Name:   
-- Module Name:   /home/ise/mips/register_file_test.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_file_test IS
END register_file_test;
 
ARCHITECTURE behavior OF register_file_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         clk : IN  std_logic;
         read_register1 : IN  std_logic_vector(4 downto 0);
         read_register2 : IN  std_logic_vector(4 downto 0);
         write_register : IN  std_logic_vector(4 downto 0);
         write_data : IN  std_logic_vector(31 downto 0);
         reg_write : IN  std_logic;
         read_data1 : OUT  std_logic_vector(31 downto 0);
         read_data2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal read_register1 : std_logic_vector(4 downto 0) := (others => '0');
   signal read_register2 : std_logic_vector(4 downto 0) := (others => '0');
   signal write_register : std_logic_vector(4 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal reg_write : std_logic := '0';
   signal read_data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal read_data2 : std_logic_vector(31 downto 0) := (others => '0');

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          clk => clk,
          read_register1 => read_register1,
          read_register2 => read_register2,
          write_register => write_register,
          write_data => write_data,
          reg_write => reg_write,
          read_data1 => read_data1,
          read_data2 => read_data2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period;
		read_register1 <= "00000";
		read_register2 <= "00000";
		wait for clk_period;
		reg_write <= '1';
		write_register <= "00010";
		write_data <= x"00000220";
		wait for clk_period;
		reg_write <= '1';
		write_register <= "00100";
		write_data <= x"00000020";
		wait for clk_period;
		reg_write <= '0';
		read_register1 <= "00010";
		read_register2 <= "00100";
		wait;
   end process;

END;
