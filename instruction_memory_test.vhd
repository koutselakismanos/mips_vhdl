--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:39:53 04/01/2022
-- Design Name:   
-- Module Name:   /home/ise/mips/instruction_memory_test.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instruction_memory
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
 
ENTITY instruction_memory_test IS
END instruction_memory_test;
 
ARCHITECTURE behavior OF instruction_memory_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instruction_memory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instruction_memory PORT MAP (
          address => address,
          instruction => instruction
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		address <= x"00000000";
		wait for 100 ns;
		address <= x"00000001";
		wait for 100 ns;
		address <= x"00000002";
		wait for 100 ns;
		address <= x"00000003";
		wait for 100 ns;
		address <= x"00000004";
		

      wait;
   end process;

END;
