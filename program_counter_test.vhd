--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:16:57 04/01/2022
-- Design Name:   
-- Module Name:   /home/ise/mips/program_counter_test.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: program_counter
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
 
ENTITY program_counter_test IS
END program_counter_test;
 
ARCHITECTURE behavior OF program_counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT program_counter
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         pc_in : IN  std_logic_vector(31 downto 0);
         pc_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal pc_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal pc_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: program_counter PORT MAP (
          clk => clk,
          clr => clr,
          pc_in => pc_in,
          pc_out => pc_out
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
      wait for 100 ns;	
		
		clr <= '1';

      wait for clk_period*10;
		clr <= '0';
		wait for clk_period*10;
		
		pc_in <= x"00000001";
		
		wait for clk_period*10;
		pc_in <= x"00000002";

		wait for clk_period*10;
		pc_in <= x"00000003";

      -- insert stimulus here 

      wait;
   end process;

END;
