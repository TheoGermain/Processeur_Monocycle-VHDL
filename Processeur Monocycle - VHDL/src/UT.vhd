library ieee;
use ieee.std_logic_1164.all;

Entity UT is Port(
  CLK, RST   : in std_logic;
  WE         : in std_logic;
  RA, RB, RW : in std_logic_vector(3 downto 0);
  OP         : in std_logic_vector(1 downto 0);
  N          : out std_logic;
  S          : out std_logic_vector(31 downto 0));
end entity;

Architecture RTL of UT is
  signal busA, busB, busW : std_logic_vector(31 downto 0);
  Begin
    
    C0 : entity work.register_bank(RTL) port map(clk => clk, RST => RST, W => busW, RA => RA, RB => RB, RW => RW, WE => WE, A => busA, B => busB);
    C1 : entity work.ALU(RTL) port map(OP => OP, A => busA, B => busB, S => busW, N => N);
    
    S <= busW;
    
end RTL;
  
  