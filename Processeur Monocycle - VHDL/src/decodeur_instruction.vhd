library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity decodeur_instruction is Port(
  instruction, flag             : in std_logic_vector(31 downto 0);
  nPCsel, PSREn, RegWr          : out std_logic; 
  RegSel, ALUsrc, WrSrc, MemWr  : out std_logic;
  ALUCtr                        : out std_logic_vector(1 downto 0));
end entity;

Architecture RTL of decodeur_instruction is
  
  type enum_instruction is (MOV, ADDi, ADDr, CMP, LDR, STR, BAL, BLT);
  signal instr_courante : enum_instruction;
  
  Begin
    
    process(instruction)
      begin
        
        if instruction(27 downto 26) = "00" then -- (ADD, MOV, CMP)
          
          if instruction(24 downto 21) = "0100" then -- ADD
            
            if instruction(25) = '1' then    -- ADD (Immediate)
            
              instr_courante <= ADDi;
              
            elsif instruction(25) = '0' then  -- ADD (register)
              
              instr_courante <= ADDr;
              
           end if;
           
          elsif instruction(24 downto 21) = "1101" then -- MOV
            
            instr_courante <= MOV;
          
          elsif instruction(24 downto 21) = "1010" then -- CMP
            
            instr_courante <= CMP;
            
          end if;
          
        elsif instruction(27 downto 26) = "01" then -- (LDR, STR)
          
          if instruction(20) = '1' then  -- LDR
            
            instr_courante <= LDR;
            
          elsif instruction(20) = '0' then -- STR
            
            instr_courante <= STR;
            
          end if;
            
        elsif instruction(27 downto 26) = "10" then -- (BAL, BLT)
          
          if instruction(31 downto 28) = "1110" then  -- BAL
            
            instr_courante <= BAL;
            
          elsif instruction(31 downto 28) = "1011" then  -- BLT
            
            instr_courante <= BLT;
            
          end if;
          
        end if;
          
      end process;
      
      process(instruction, instr_courante)
        begin
          
          if instr_courante = ADDi then
            nPCSel <= '0';
            RegWr <= '1';
            ALUSrc <= '1';
            ALUCtr <= "00";
            PSREn <= '0';
            MemWr <= '0';
            WrSrc <= '0';
            RegSel <= '0';
            
          elsif instr_courante = ADDr then
            nPCSel <= '0';
            RegWr <= '1';
            ALUSrc <= '0';
            ALUCtr <= "00";
            PSREn <= '0';
            MemWr <= '0';
            WrSrc <= '0';
            RegSel <= '0';
            
          elsif instr_courante = MOV then
            nPCSel <= '0';
            RegWr <= '1';
            ALUSrc <= '1';
            ALUCtr <= "01";
            PSREn <= '0';
            MemWr <= '0';
            WrSrc <= '0';
            RegSel <= '0';
            
          elsif instr_courante = CMP then
            nPCSel <= '0';
            RegWr <= '0';
            ALUSrc <= '1';
            ALUCtr <= "10";
            PSREn <= '1';
            MemWr <= '0';
            WrSrc <= '0';
            RegSel <= '0';
            
          elsif instr_courante = LDR then
            nPCSel <= '0';
            RegWr <= '1';
            ALUSrc <= '1';
            ALUCtr <= "00";
            PSREn <= '0';
            MemWr <= '0';
            WrSrc <= '1';
            RegSel <= '0';
            
          elsif instr_courante = STR then 
            nPCSel <= '0';
            RegWr <= '0';
            ALUSrc <= '1';
            ALUCtr <= "00";
            PSREn <= '0';
            MemWr <= '1';
            RegSel <= '1';
            
          elsif instr_courante = BAL then
            nPCSel <= '1';
            RegWr <= '0';
            PSREn <= '0';
            MemWr <= '0';
            WrSrc <= '0';
            RegSel <= '0';
            
         elsif instr_courante = BLT then
           
           if flag = std_logic_vector(to_unsigned(1, 32)) then -- Conditon respectee
              
              nPCSel <= '1';
              RegWr <= '0';
              PSREn <= '0';
              MemWr <= '0';
              RegSel <= '0';
              
            else    -- Condition non respectee
              
             
              nPCSel <= '0';
              RegWr <= '0';
              PSREn <= '0';
              MemWr <= '0';
              RegSel <= '0';
              
            end if;
          end if;
          
      end process;
    
    
end RTL;
  