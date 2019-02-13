library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity majCPT is Port(
  CLK, nPCsel   : in std_logic;
  PCin, SignExt : in std_logic_vector(31 downto 0);
  PCout         : out std_logic_vector(31 downto 0));
end entity;


Architecture RTL of majCPT is
  begin
    
    process(CLK,nPCsel)
      begin
        
        if clk = '1' then
          
          if nPCsel = '1' then
            PCout <= std_logic_vector(  to_unsigned( to_integer(unsigned(PCin)) + 4 + to_integer(unsigned(SignExt)), 32) ) ;-- +1 ou +4 ?
          else
            PCout <= std_logic_vector(  to_unsigned( to_integer(unsigned(PCin)) + 4, 32) ) ;-- +1 ou +4 ?
          end if;
          
        end if;
        
    end process;
  
end RTL;
        
        