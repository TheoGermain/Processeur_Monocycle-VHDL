library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity UT_tb is Port(
end entity;

Architecture TB of UT_tb is
  
  signal CLK, RST   : std_logic;
  signal WE         : std_logic;
  signal RA, RB, RW : std_logic_vector(3 downto 0);
  signal OP         : std_logic_vector(1 downto 0);
  signal N          : std_logic;
  signal S          : std_logic_vector(31 downto 0);
  
  Begin
    
    process
      begin
        
       clk <= '0';
    
       RST <= '0';
    
       OP <= "11";
       WE <= '1';
       RA <= "1111";
       RB <= "0100";
       RW <= "0001";
    
       wait for 5 ns;
     
       clk <= '1';
    
       wait for 5 ns;
       
       clk <= '0';
       
       OP <= "00";
       RA <= "0001";
       RB <= "1111";
       
       wait for 5 ns;
       
       clk <= '1';
       
       wait for 5 ns;
       
       clk <= '0';
       
       wait for 5 ns;
       
       clk <= '1';
       wait for 5 ns;
       clk <= '0';
       
       
       
       
    
    wait;
  end process;
    
    UUT: entity work.UT(RTL)  port map (clk => clk, rst => rst, WE => WE, RA => RA, RB => RB, RW => RW, OP => OP, N => N, S => S);
      
end TB;