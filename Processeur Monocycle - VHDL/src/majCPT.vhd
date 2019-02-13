library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity majCPT is Port(
  nPCsel   : in std_logic;
  PCin, SignExt : in std_logic_vector(31 downto 0);
  PCout         : out std_logic_vector(31 downto 0));
end entity;


Architecture RTL of majCPT is
  begin
    
    process(nPCsel, PCin)
      begin
        
          
          if nPCsel = '1' then
            
            PCout <= std_logic_vector(unsigned(PCin) + 1 + unsigned(SignExt));
            
          else
            PCout <= std_logic_vector(unsigned(PCin) + 1) ;
            
          end if;
          
        
    end process;
  
end RTL;
        
        