library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity unite_de_gestion_tb is Port(
  OK : out boolean);
end entity;

Architecture TB of unite_de_gestion_tb is
  
  signal CLK, RST    : std_logic;
  signal offset      : std_logic_vector(23 downto 0);
  signal nPCsel      : std_logic;
  signal instruction : std_logic_vector(31 downto 0);
  
  Begin
    
    process
      begin
        
        OK <= true;
        clk <= '0';
        rst <= '1';
        wait for 5 ns;
        rst <= '0';
        
        -- Test de la sortie instruction sans offset
        
        nPCsel <= '0'; 
        wait for 5 ns;
        clk <= '1';
        
        if instruction /= x"E3A01020" then
          OK <= false;
        end if;
        
        wait for 5 ns;
        clk <= '0';
        
        wait for 5 ns;
        clk <= '1';
        
        if instruction /= x"E3A02000" then
          OK <= false;
        end if;
        
        wait for 5 ns;
        clk <= '0';
        
        wait for 5 ns;
        clk <= '1';
        
        if instruction /= x"E6110000" then
          OK <= false;
        else
          OK <= true;
        end if;
        
        wait for 5 ns;
        clk <= '0';
        
        -- Test de la sortie instruction avec offset
        
        nPCsel <= '1';
        offset <= std_logic_vector(to_unsigned(2, 24));
        
        wait for 5 ns;
        
        clk <= '1';
        
        if instruction /= x"BAFFFFFB" then
          OK <= false;
        else
          OK <= true;
        end if;
        
        wait;
        
  end process;
  
  UUT: entity work.unite_de_gestion(RTL)  port map (clk => clk, rst => rst, offset => offset, nPCsel => nPCsel, instruction => instruction);
    
end TB;