library ieee;
use ieee.std_logic_1164.all;

Entity assemblage_UT is Port(
  CLK, RST, RegSel : in std_logic;
  RegWr, WrEn      : in std_logic;
  Rd, Rn, Rm       : in std_logic_vector(3 downto 0);
  Imm              : in std_logic_vector(7 downto 0);
  ALUCtr           : in std_logic_vector(1 downto 0); 
  ALUSrc, WrSrc    : in std_logic;
  flag             : out std_logic);
end entity;

Architecture RTL of assemblage_UT is 
  signal busA, busB, busW : std_logic_vector(31 downto 0);
  signal imm_extended     : std_logic_vector(31 downto 0);
  signal ALUout, DataOut  : std_logic_vector(31 downto 0);
  signal muxToAlu         : std_logic_vector(31 downto 0);
  signal RB               : std_logic_vector(3 downto 0);
  
  Begin
    
    C0 : entity work.register_bank(RTL) port map(clk => clk, rst => rst, W => busW, RA => Rn, RB => RB, RW => Rd, WE => RegWr, A => busA, B => busB);
    C1 : entity work.MUX21(behav) generic map(N => 32) port map(A => busB, B => imm_extended, COM => ALUSrc, S => muxToAlu);
    C2 : entity work.imm_extender(RTL) generic map(N => 8) port map(E => Imm, S => imm_extended);
    C3 : entity work.ALU(RTL) port map(OP => ALUCtr, A => busA, B => muxToAlu, S => ALUout, N => flag);
    C4 : entity work.data_memory(RTL) port map(CLK => CLK, Addr => ALUout(5 downto 0), WrEn => WrEn, DataIn => busB, DataOut => DataOut);
    C5 : entity work.MUX21(behav) generic map(N => 32) port map(A => ALUout, B => DataOut, COM => WrSrc, S => busW);
    C6 : entity work.MUX21(behav) generic map (N => 4) port map(A => Rm, B => Rd, COM => RegSel, S => RB);
    
end RTL;