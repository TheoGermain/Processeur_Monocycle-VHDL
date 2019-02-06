library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity ALU_tb is Port(
  OK : out boolean);
end entity;

Architecture TB of ALU_tb is
  
  signal OP   :  std_logic_vector(1 downto 0);
  signal A, B :  std_logic_vector(31 downto 0);
  signal S    :  std_logic_vector(31 downto 0);
  signal N    :  std_logic;
  
  Begin
  
  process
    begin
      OK <= true;
      
      OP <= "00"; -- Addition
      
      A <= std_logic_vector(to_signed(2, 32));
      B <= std_logic_vector(to_signed(3, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(5, 32)) or N /= '0' then
        OK <= false;
      end if;
      
      
      A <= std_logic_vector(to_signed(-1, 32));
      B <= std_logic_vector(to_signed(-7, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(-8, 32)) or N /= '1' then
        OK <= false;
      end if;
      
      
      A <= std_logic_vector(to_signed(-3, 32));
      B <= std_logic_vector(to_signed(5, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(2, 32)) or N /= '0' then
        OK <= false;
      end if;
      
      
      A <= std_logic_vector(to_signed(2147483647, 32));
      B <= std_logic_vector(to_signed(1, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(-2147483648, 32)) or N /= '1' then
        OK <= false;
      end if;
      
      OP <= "01"; -- S <= B
      
      B <= std_logic_vector(to_signed(26, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(26, 32)) or N /= '0' then
        OK <= false;
      end if;
      
      
      B <= std_logic_vector(to_signed(-10, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(-10, 32)) or N /= '1' then
        OK <= false;
      end if;
      
      OP <= "10"; -- Soustraction
      
      A <= std_logic_vector(to_signed(2, 32));
      B <= std_logic_vector(to_signed(3, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(-1, 32)) or N /= '1' then
        OK <= false;
      end if;
      
      
      A <= std_logic_vector(to_signed(10, 32));
      B <= std_logic_vector(to_signed(5, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(5, 32)) or N /= '0' then
        OK <= false;
      end if;
      
      
      A <= std_logic_vector(to_signed(0, 32));
      B <= std_logic_vector(to_signed(1, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(-1, 32)) or N /= '1' then
        OK <= false;
      end if;
      
      
      OP <= "11"; -- S <= A
      
      A <= std_logic_vector(to_signed(26, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(26, 32)) or N /= '0' then
        OK <= false;
      end if;
      
      
      A <= std_logic_vector(to_signed(-10, 32));
      wait for 5 ns;
      
      if S /= std_logic_vector(to_signed(-10, 32)) or N /= '1' then
        OK <= false;
      end if;
      
      wait;   
  end process;
    
    UUT: entity work.ALU(RTL)  port map (OP => OP, A => A, B => B, S => S, N => N);

  
end TB;

