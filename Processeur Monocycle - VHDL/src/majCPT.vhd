library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity majCPT is Port(
  nPCsel   : in std_logic;
  majPCin, SignExt : in std_logic_vector(31 downto 0);
  majPCout         : out std_logic_vector(31 downto 0));
end entity;


Architecture RTL of majCPT is
  begin
    
    process(nPCsel, majPCin, SignExt)
      begin
        
          
          if nPCsel = '1' then
            
            majPCout <= std_logic_vector(to_unsigned(to_integer(unsigned(majPCin)) + 1 + to_integer(signed(SignExt)), 32));
            
          else
            majPCout <= std_logic_vector(unsigned(majPCin) + 1) ;
            
          end if;
          
        
    end process;
  
end RTL;
        
        