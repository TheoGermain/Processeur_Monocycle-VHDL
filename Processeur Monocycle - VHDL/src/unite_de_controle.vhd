library ieee;
use ieee.std_logic_1164.all;

Entity unite_de_controle is Port(
  CLK, RST, dataIn        : in std_logic;
  instruction             : in std_logic_vector(31 downto 0);
  nPCsel, RegWr, RegSel   : out std_logic;
  ALUsrc, WrSrc, MemWr    : out std_logic;
  ALUCtr                  : out std_logic_vector(1 downto 0));
end entity;

Architecture RTL of unite_de_controle is
  
  signal flag  : std_logic_vector(31 downto 0);
  signal PSREn : std_logic;
  
  Begin
    
    C0 : entity work.psr(RTL) port map(DATAIN => dataIn, CLK => CLK, RST => RST, WE => PSREn, DATAOUT => flag);
    C1 : entity work.decodeur_instruction(RTL) port map(instruction => instruction, flag => flag, nPCsel => nPCsel, PSREn => PSREn, RegWr => RegWr, RegSel => RegSel, ALUsrc => ALUsrc, WrSrc => WrSrc, MemWr => MemWr, ALUCtr => ALUCtr); 
    
end RTL;