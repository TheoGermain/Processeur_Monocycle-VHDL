library ieee;
use ieee.std_logic_1164.all;

Entity assemblage_UT_tb is
end entity;

Architecture TB of assemblage_UT_tb is

  signal CLK, RST    :  std_logic;
  signal RegWr, WrEn :  std_logic;
  signal RW, RA, RB  :  std_logic_vector(3 downto 0);
  signal Imm         :  std_logic_vector(7 downto 0);
  signal OP          :  std_logic_vector(1 downto 0); 
  signal SEL1, SEL2  :  std_logic;
  signal flag        :  std_logic;
  
  Begin
    
    process
      begin
        clk <= '0';
        rst <= '0';
        RegWr <= '0';
        WrEn <= '0';
        
        -- Addition de deux registres (R1 = R1 + R15)
        
        RegWr <= '1';
        RW <= "0001";
        RA <= "0001";
        RB <= "1111";
        SEL1 <= '0';
        SEL2 <= '0';
        OP <= "00";
        
        wait for 5 ns;
        
        clk <= '1'; --Verification visuelle grâce à banc
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Addition d'un registre avec une valeur immédiate (R2 = R1 + 20)
        
        RegWr <= '1';
        RW <= "0010";
        RA <= "0001";
        Imm <= "00010100";
        SEL1 <= '1';
        SEL2 <= '0';
        OP <= "00";
        
        wait for 5 ns;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Soustraction de deux registres (R3 = R2 - R1)
        
        RegWr <= '1';
        RW <= "0011";
        RA <= "0010";
        RB <= "0001";
        SEL1 <= '0';
        SEL2 <= '0';
        OP <= "10";
        
        wait for 5 ns;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Soustraction d'une valeur immédiate et d'un registre (R4 = R3 - 35)
        
        RegWr <= '1';
        RW <= "0100";
        RA <= "0011";
        Imm <= "00100011";
        SEL1 <= '1';
        SEL2 <= '0';
        OP <= "10";
        
        wait for 5 ns;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Copie d'un registre dans un autre (R5 = R2)
        
        RegWr <= '1';
        RW <= "0101";
        RA <= "0010";
        SEL1 <= '0';
        SEL2 <= '0';
        OP <= "11";
        
        wait for 5 ns;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Ecriture d'un registre dans la mémoire (M10 = R4)
        
        RegWr <= '0';
        WrEn <= '1';
        RB <= "0100";
        Imm <= "00001010";
        SEL1 <= '1';
        OP <= "01";
        
        wait for 5 ns;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Lecture d'un mot de la mémoire dans un registre (R6 = M10)
        
        RegWr <= '1';
        WrEn <= '0';
        RW <= "0110";
        Imm <= "00001010";
        SEL1 <= '1';
        SEL2 <= '1';
        OP <= "01";
        
        wait for 5 ns;
        
        clk <= '1';
     
        wait;
    end process;
    
    UUT: entity work.assemblage_UT(RTL)  port map (clk => clk, rst => rst, RegWr => RegWr, WrEn => WrEn, RW => RW, RA => RA, RB => RB, Imm => Imm, OP => OP, SEL1 => SEL1, SEL2 => SEL2, flag => flag);

end TB;