library ieee;
use ieee.std_logic_1164.all;

Entity PC_EXTENDER is 
  port( E    : in std_logic_vector(23 downto 0);
        S    : out std_logic_vector(31 downto 0));
end entity;
  
Architecture RTL of PC_EXTENDER is
  Begin
    
    process(E)
      begin
    
      for i in 31 downto 24 loop
       S(i) <= E(23);
      end loop;
    
      for i in 0 to 23 loop
        S(i) <= E(i);
      end loop;
    
    end process;
    
end RTL;