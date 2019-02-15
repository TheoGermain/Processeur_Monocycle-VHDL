library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity processeur_monocycle_tb is Port(
  OK : out boolean); 
end entity;

Architecture TB of processeur_monocycle_tb is
  
  signal CLK, RST : std_logic;
  signal verif    : std_logic_vector(31 downto 0);
  
  Begin
    
    clocked : process
      begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
      end process;
    
  
  process
    begin
      ok <= true;
      rst <= '1';
      
      wait for 5 ns;
      
      rst <= '0' ;
      
      if verif /= std_logic_vector(to_unsigned(32, 32)) then    -- R1 <= 32
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(0, 32)) then     -- R2 <= 0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(33, 32)) then    -- R0 <= MEM[R1] -- 33 correspond a  la valeur dans data memory
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(33, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(33, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;
      
      if verif /= std_logic_vector(to_unsigned(34, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(67, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(34, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;   -- cmp + branchement
      
      if verif /= std_logic_vector(to_unsigned(35, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(102, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(35, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;
      
      if verif /= std_logic_vector(to_unsigned(36, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(138, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(36, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;
      
      if verif /= std_logic_vector(to_unsigned(37, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(175, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(37, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;
      
      if verif /= std_logic_vector(to_unsigned(38, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(213, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(38, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;
      
      if verif /= std_logic_vector(to_unsigned(39, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(252, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(39, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;
      
      if verif /= std_logic_vector(to_unsigned(40, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(292, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(40, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;
      
      if verif /= std_logic_vector(to_unsigned(41, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(333, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(41, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 30 ns;
      
      if verif /= std_logic_vector(to_unsigned(42, 32)) then    -- R0 <= MEM[R1]
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(375, 32)) then    -- R2 <= R2 + R0
        OK <= false;
      else
        OK <= true;
      end if;
      
      wait for 10 ns;
      
      if verif /= std_logic_vector(to_unsigned(42, 32)) then    -- R1 + 1
        OK <= false;
      else
        OK <= true;
      end if;
      
      
      wait for 40 ns;   -- Verification visuelle du STR
      
  end process;
  
  UUT: entity work.processeur_monocycle(RTL)  port map (CLK => CLK, RST => RST, verif => verif);
  
end TB;