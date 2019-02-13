library ieee;
use ieee.std_logic_1164.all;

Entity PC is Port(
  CLK, RST  : in std_logic;
  Entree    : in std_logic_vector(31 downto 0);
  Sortie    : out std_logic_vector(31 downto 0));
end entity;

Architecture RTL of PC is
  Begin
    
    process(clk, rst)
      
      begin
        
        if clk = '1' then
          
          if RST = '1' then
            Sortie <= (others => '0');
          else
          Sortie <= Entree;
          end if;
          
        end if;
        
    end process;
  
end RTL;



