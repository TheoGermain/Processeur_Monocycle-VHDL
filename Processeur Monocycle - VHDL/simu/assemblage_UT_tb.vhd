library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity assemblage_UT_tb is Port(
  OK : out boolean);
end entity;

Architecture TB of assemblage_UT_tb is

  signal CLK, RST       :  std_logic;
  signal RegWr, WrEn    :  std_logic;
  signal Rd, Rn, Rm     :  std_logic_vector(3 downto 0);
  signal Imm            :  std_logic_vector(7 downto 0);
  signal ALUCtr         :  std_logic_vector(1 downto 0); 
  signal ALUSrc, WrSrc  :  std_logic;
  signal flag           :  std_logic;
  signal Sortie_verif   :  std_logic_vector(31 downto 0);
  signal RegSel         :  std_logic;
  
  Begin
    
    process
      begin
        OK <= true;
        clk <= '0';
        rst <= '0';
        RegWr <= '0';
        WrEn <= '0';
        RegSel <= '0';
        
        -- Addition de deux registres (R1 = R1 + R15)
        
        RegWr <= '1';
        Rd <= "0001";
        Rn <= "0001";
        Rm <= "1111";
        ALUSrc <= '0';
        WrSrc <= '0';
        ALUCtr <= "00";
        
        
        
        wait for 5 ns;
        
        if Sortie_verif /= X"00000030" then
          OK <= false;
        else
          OK <= true;
        end if;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Addition d'un registre avec une valeur immédiate (R2 = R1 + 20)
        
        RegWr <= '1';
        Rd <= "0010";
        Rn <= "0001";
        Imm <= "00010100";
        ALUSrc <= '1';
        WrSrc <= '0';
        ALUCtr <= "00";
        
        wait for 5 ns;
        
        if Sortie_verif /= std_logic_vector(to_unsigned(68, 32)) then
          OK <= false;
        else
          OK <= true;
        end if;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Soustraction de deux registres (R3 = R2 - R1)
        
        RegWr <= '1';
        Rd <= "0011";
        Rn <= "0010";
        Rm <= "0001";
        ALUSrc <= '0';
        WrSrc <= '0';
        ALUCtr <= "10";
        
        
        wait for 5 ns;
        
        if Sortie_verif /= std_logic_vector(to_unsigned(20, 32)) then
          OK <= false;
        else
          OK <= true;
        end if;
        
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Soustraction d'une valeur immédiate et d'un registre (R4 = R3 - 35)
        
        RegWr <= '1';
        Rd <= "0100";
        Rn <= "0011";
        Imm <= "00100011";
        ALUSrc <= '1';
        WrSrc <= '0';
        ALUCtr <= "10";
        
        
        wait for 5 ns;
        
        if Sortie_verif /= std_logic_vector(to_signed(-15, 32)) then
          OK <= false;
        else
          OK <= true;
        end if;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Copie d'un registre dans un autre (R5 = R2)
        
        RegWr <= '1';
        Rd <= "0101";
        Rn <= "0010";
        ALUSrc <= '0';
        WrSrc <= '0';
        ALUCtr <= "11";
        
        wait for 5 ns;
        
        if Sortie_verif /= std_logic_vector(to_unsigned(68, 32)) then
          OK <= false;
        else
          OK <= true;
        end if;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
        
        -- Ecriture d'un registre dans la mémoire (M10 = R4)
        
        RegWr <= '0';
        WrEn <= '1';
        Rm <= "0100";
        Imm <= "00001010";
        ALUSrc <= '1';
        WrSrc <= '1';
        ALUCtr <= "01";
        
        wait for 5 ns;
        
        clk <= '1';
        
        wait for 2 ns;
        
        if Sortie_verif /= std_logic_vector(to_signed(-15, 32)) then
          OK <= false;
        else
          OK <= true;
        end if;
        
        wait for 3 ns;
        
        clk <= '0';
        
        -- Lecture d'un mot de la mémoire dans un registre (R6 = M10)
        
        RegWr <= '1';
        WrEn <= '0';
        Rd <= "0110";
        Imm <= "00001010";
        ALUSrc <= '1';
        WrSrc <= '1';
        ALUCtr <= "01";
        
        wait for 5 ns;
        
        if Sortie_verif /= std_logic_vector(to_signed(-15, 32)) then
          OK <= false;
        else
          OK <= true;
        end if;
        
        clk <= '1';
        
        wait for 5 ns;
        
        clk <= '0';
     
        wait;
    end process;
    
    UUT: entity work.assemblage_UT(RTL)  port map (clk => clk, rst => rst, RegWr => RegWr, WrEn => WrEn, Rd => Rd, Rn => Rn, Rm => Rm, Imm => Imm, ALUCtr => ALUCtr, ALUSrc => ALUSrc, WrSrc => WrSrc, flag => flag, Sortie_verif => Sortie_verif, RegSel => RegSel);

end TB;