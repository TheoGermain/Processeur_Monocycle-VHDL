library IEEE;
use IEEE.std_logic_1164.all;

Entity processeur_monocycle is Port(
  CLK, RST : in std_logic;
  verif    : out std_logic_vector(31 downto 0));
end entity;

Architecture RTL of processeur_monocycle is
  
  signal instruction                   : std_logic_vector(31 downto 0);
  signal nPCsel, WrSrc, MemWr, ALUSrc  : std_logic;
  signal RegSel, RegWr, flag           : std_logic;
  signal ALUCtr                        : std_logic_vector(1 downto 0);
  signal Sortie_verif                  : std_logic_vector(31 downto 0);
  
  Begin
    
    C0 : entity work.unite_de_gestion(RTL) port map(CLK => CLK, RST => RST, offset => instruction(23 downto 0), nPCsel => nPCsel, instruction => instruction);
    C1 : entity work.assemblage_UT(RTL) port map(CLK => CLK, RST => RST, RegSel => RegSel, RegWr => RegWr, WrEn => MemWr, Rd => instruction(15 downto 12), Rn => instruction(19 downto 16), Rm => instruction(3 downto 0), Imm => instruction(7 downto 0), ALUctr => ALUctr, ALUSrc => ALUSrc, WrSrc => WrSrc, flag => flag, Sortie_verif => Sortie_verif);
    C2 : entity work.unite_de_controle(RTL) port map(CLK => CLK, RST => RST, DataIn => flag, instruction => instruction, nPCsel => nPCsel, RegWr => RegWr, RegSel => RegSel, ALUsrc => ALUsrc, WrSrc => WrSrc, MemWr => MemWr, ALUCtr => ALUCtr);
     
    verif <= Sortie_verif;
     
end RTL;