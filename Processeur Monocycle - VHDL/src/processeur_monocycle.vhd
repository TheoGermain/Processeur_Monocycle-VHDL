library IEEE;
use IEEE.std_logic_1164.all;

Entity processeur_monocycle is Port(
  CLK, RST : in std_logic);
end entity;

Architecture RTL of processeur_monocycle is
  
  signal instruction                   : std_logic_vector(31 downto 0);
  signal nPCsel, WrSrc, MemWr, ALUSrc  : std_logic;
  signal RegSel, RegWr, flag           : std_logic;
  signal Rd, Rn, Rm                    : std_logic_vector(3 downto 0);
  signal ALUCtr                        : std_logic_vector(1 downto 0);
  
  Begin
    
    C0 : entity work.unite_de_gestion(RTL) port map(CLK => CLK, RST => RST, offset => instruction(23 downto 0), nPCsel => nPCsel, instruction => instruction);
    C1 : entity work.assemblage_UT(RTL) port map(CLK => CLK, RST => RST, RegSel => RegSel, RegWr => RegWr, WrEn => MemWr, Rd => Rd, Rn => Rn, Rm => Rm, Imm => instruction(7 downto 0), ALUctr => ALUctr, ALUSrc => ALUSrc, WrSrc => WrSrc, flag => flag);
    C2 : entity work.unite_de_controle(RTL) port map(CLK => CLK, RST => RST, DataIn => flag, instruction => instruction, nPCsel => nPCsel, RegWr => RegWr, RegSel => RegSel, ALUsrc => ALUsrc, WrSrc => WrSrc, MemWr => MemWr, Rn => Rn, Rm => Rm, Rd => Rd, ALUCtr => ALUCtr);
     
    
end RTL;