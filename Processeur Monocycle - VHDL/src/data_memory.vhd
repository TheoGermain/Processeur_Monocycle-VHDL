library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity data_memory is Port(
  CLK, RST  : in std_logic;
  Addr      : in std_logic_vector(5 downto 0);
  WrEn      : in std_logic;
  DataIn    : in std_logic_vector(31 downto 0);
  DataOut   : out std_logic_vector(31 downto 0));
end entity;

Architecture RTL of data_memory is
  
  type table is array (63 downto 0) of std_logic_vector(31 downto 0);
  
  -- Fonction d'initialisation 
  function init_banc return table is
  
  variable result : table;
  
  begin
    
    for i in 63 downto 0 loop 
      result(i) := (others =>'0');
    end loop;
    return result;
    
    end init_banc;
    
    -- Declaration et initialisation du Banc de registre 
  signal Banc : table := init_banc;
  
  
  
  Begin
    
    DataOut <= Banc(to_integer(unsigned(Addr)));
    
    process(clk, rst)
      begin
        
        if RST = '1' then
          for i in 63 downto 0 loop 
            Banc(i) <= (others =>'0');
          end loop;
          
        elsif rising_edge(clk) then
          if WrEn = '1' then
            Banc(to_integer(unsigned(Addr))) <= DataIn;
          end if;
        end if;
        
    end process;
    
    
    
    
end RTL;