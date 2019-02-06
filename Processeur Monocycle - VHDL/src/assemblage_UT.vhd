library ieee;
use ieee.std_logic_1164.all;

Entity assemblage_UT is Port(
  CLK, RST    : in std_logic;
  RegWr, WrEn : in stg_logic;
  RW, RA, RB  : in std_logic_vector(3 downto 0);
  Imm         : in std_logic_vector(7 downto 0);
  OP          : in std_logic_vector(1 downto 0); 
  SEL1, SEL2  : in std_logic;
  flag        : out std_logic);
end entity;

Architecture RTL of assemblage_UT is 
  signal busA, busB, busW : std_logic_vector(31 downto 0);
  signal imm_extended : std_logic_vector(31 downto 0);
  signal ALUout, DataIn, DataOut : std_logic_vector(31 downto 0);
  signal muxToAlu : std_logic_vector(31 downto 0);
  Begin
    
    C0 : entity work.register_bank(RTL) port map(clk => clk, rst => rst, W => busW, RA => RA, RB => RB, RW => RW, WE => RegWr, A => busA, B => busB);
    C1 : entity work MUX21(behav) generic map(N => 32) port map(A => busB, B => imm_extended, COM => SEL1, S => muxToAlu);
    C2 : entity work.imm_extender(RTL) generic map(N => 8) port map(E => Imm, S => imm_extended);
    C3 : entity work.ALU(RTL) port map(OP => OP, A => busA, B => muxToAlu, S => ALUout, N => flag);
     
    
    
end RTL;