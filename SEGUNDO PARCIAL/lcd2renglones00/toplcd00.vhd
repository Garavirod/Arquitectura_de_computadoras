library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagelcd00.all;

entity toplcd00 is
  port(
       clk0: inout std_logic;
	   cdiv0: in std_logic_vector(4 downto 0);
	   en0: in std_logic;
	   outFlagContConfig0: inout std_logic;
	   outFlagConfig0: inout std_logic;
	   outFlagContData0: inout std_logic;
	   outFlagData0: inout std_logic;
	   outContConfig0: inout std_logic_vector(4 downto 0);
	   outContData0: inout std_logic_vector(4 downto 0);
	   outWordled0: out std_logic_vector(7 downto 0);
	   outWordlcd0: out std_logic_vector(7 downto 0);
	   RWled0, RSled0, ENled0: out std_logic;
	   RWlcd0, RSlcd0, ENlcd0: out std_logic);
end toplcd00;

architecture toplcd0 of toplcd00 is
signal sWord: std_logic_vector(7 downto 0);
signal sRW, sRS, sEN: std_logic;
signal sWordConfig: std_logic_vector(7 downto 0);
signal sWordData: std_logic_vector(7 downto 0);
signal sRWcf, sRScf, sENcf: std_logic;
signal sRWcd, SRScd, sENcd: std_logic;
begin
outWordled0 <= sWord;
outWordlcd0 <= sWord;
RWled0 <= sRW;
RWlcd0 <= sRW;
RSled0 <= sRS;
RSlcd0 <= sRS;
ENled0 <= sEN;
ENlcd0 <= sEN;

  LC00: topdiv00 port map(oscout0 => clk0,
                          indiv0 => cdiv0);
  
  LC01: lcdContConfig00 port map(clkcc => clk0,
                                 enablecc => en0,
								 inFlagcc => outFlagConfig0,
								 outcontcc => outContConfig0,
                                 outFlagcc => outFlagContConfig0);
  
  LC02: lcdConfig00 port map(clkcf => clk0,
                             enablecf => en0,
							 inFlagcf => outFlagContConfig0,
							 incontcf => outContConfig0,
							 commandcf => sWordConfig,
							 outFlagcf => outFlagConfig0,
							 RWcf => sRWcf,
							 RScf => sRScf,
                             ENcf => sENcf);
  
  LC03: lcdContData00 port map(clkcd => clk0,
                               enablecd => en0,
							   inFlagcd => outFlagConfig0,--outFlagConfig0,
							   outContcd => outContData0,
							   outFlagcd => outFlagContData0,
							   RWcd => sRWcd,
							   RScd => sRScd,
                               ENcd => sENcd);
  
  LC04: lcdData00 port map(clkw => clk0,
                           enablew => en0,
						   inFlagw => outFlagConfig0,--outFlagContData0,
						   incontw => outcontData0,
						   outWordw => sWordData,
                           outFlagw => outFlagData0);
  
  LC05: lcdmux00 port map(enablem => en0,
                          inFlagm => outFlagConfig0,--outFlagdata0,
						  inWordConfigm => sWordConfig,
						  inWordDatam => sWordData,
						  RWcfm => sRWcf,
						  RScfm => sRScf,
						  ENcfm => sENcf,
						  RWcdm => sRWcd,
						  RScdm => sRScd,
						  ENcdm => sENcd,
						  RWm => sRW,
						  RSm => sRS,
                          ENm => sEN,
						  outWordm => sWord);
end toplcd0;