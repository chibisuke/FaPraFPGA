library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package constants is
	type tCoeff is array(0 to 128) of signed(23 downto 0);
	type tCoeffArr is array(0 to 3) of tCoeff;
	constant COEFFICIENTS_1: tCoeff := (
		x"000078",x"0000a5",x"0000d7",x"00010d",x"000146",x"000180",x"0001b8",x"0001ed",
		x"00021a",x"00023e",x"000256",x"00025e",x"000253",x"000234",x"0001fd",x"0001ad",
		x"000142",x"0000bc",x"00001b",x"ffff5f",x"fffe89",x"fffd9d",x"fffc9d",x"fffb8f",
		x"fffa76",x"fff95b",x"fff843",x"fff736",x"fff63d",x"fff560",x"fff4aa",x"fff422",
		x"fff3d2",x"fff3c4",x"fff400",x"fff48e",x"fff574",x"fff6b9",x"fff861",x"fffa70",
		x"fffce7",x"ffffc5",x"000309",x"0006b1",x"000ab5",x"000f0e",x"0013b4",x"00189a",
		x"001db5",x"0022f6",x"00284e",x"002dae",x"003304",x"00383f",x"003d4e",x"004220",
		x"0046a3",x"004ac9",x"004e82",x"0051c1",x"00547a",x"0056a2",x"005833",x"005926",
		x"005977",x"005926",x"005833",x"0056a2",x"00547a",x"0051c1",x"004e82",x"004ac9",
		x"0046a3",x"004220",x"003d4e",x"00383f",x"003304",x"002dae",x"00284e",x"0022f6",
		x"001db5",x"00189a",x"0013b4",x"000f0e",x"000ab5",x"0006b1",x"000309",x"ffffc5",
		x"fffce7",x"fffa70",x"fff861",x"fff6b9",x"fff574",x"fff48e",x"fff400",x"fff3c4",
		x"fff3d2",x"fff422",x"fff4aa",x"fff560",x"fff63d",x"fff736",x"fff843",x"fff95b",
		x"fffa76",x"fffb8f",x"fffc9d",x"fffd9d",x"fffe89",x"ffff5f",x"00001b",x"0000bc",
		x"000142",x"0001ad",x"0001fd",x"000234",x"000253",x"00025e",x"000256",x"00023e",
		x"00021a",x"0001ed",x"0001b8",x"000180",x"000146",x"00010d",x"0000d7",x"0000a5",
		x"000078"	
	);
	
	constant COEFFICIENTS_2: tCoeff := (
		x"ffff90",x"ffff60",x"ffff30",x"ffff00",x"fffec0",x"fffe80",x"fffe50",x"fffe20",
		x"fffdf0",x"fffdd0",x"fffdb0",x"fffdb0",x"fffdb0",x"fffdd0",x"fffe10",x"fffe60",
		x"fffec0",x"ffff50",x"fffff0",x"0000a0",x"000170",x"000260",x"000360",x"000470",
		x"000580",x"0006a0",x"0007b0",x"0008c0",x"0009c0",x"000a90",x"000b50",x"000bd0",
		x"000c20",x"000c30",x"000bf0",x"000b60",x"000a80",x"000940",x"000790",x"000580",
		x"000310",x"000030",x"fffd00",x"fff960",x"fff550",x"fff100",x"ffec60",x"ffe770",
		x"ffe260",x"ffdd20",x"ffd7c0",x"ffd270",x"ffcd10",x"ffc7e0",x"ffc2d0",x"ffbe00",
		x"ffb980",x"ffb550",x"ffb1a0",x"ffae60",x"ffabb0",x"ffa980",x"ffa7f0",x"ffa700",
		x"07a700",x"ffa700",x"ffa7f0",x"ffa980",x"ffabb0",x"ffae60",x"ffb1a0",x"ffb550",
		x"ffb980",x"ffbe00",x"ffc2d0",x"ffc7e0",x"ffcd10",x"ffd270",x"ffd7c0",x"ffdd20",
		x"ffe260",x"ffe770",x"ffec60",x"fff100",x"fff550",x"fff960",x"fffd00",x"000030",
		x"000310",x"000580",x"000790",x"000940",x"000a80",x"000b60",x"000bf0",x"000c30",
		x"000c20",x"000bd0",x"000b50",x"000a90",x"0009c0",x"0008c0",x"0007b0",x"0006a0",
		x"000580",x"000470",x"000360",x"000260",x"000170",x"0000a0",x"fffff0",x"ffff50",
		x"fffec0",x"fffe60",x"fffe10",x"fffdd0",x"fffdb0",x"fffdb0",x"fffdb0",x"fffdd0",
		x"fffdf0",x"fffe20",x"fffe50",x"fffe80",x"fffec0",x"ffff00",x"ffff30",x"ffff60",
		x"ffff90"
	);
	
	constant COEFFICIENTS_3: tCoeff := (
		x"001E2F",x"FFF66D",x"FFF6EB",x"FFF6DD",x"FFF66E",x"FFF5C4",x"FFF4FE",x"FFF43B",
		x"FFF396",x"FFF325",x"FFF2FD",x"FFF32E",x"FFF3C6",x"FFF4CB",x"FFF644",x"FFF82F",
		x"FFFA84",x"FFFD39",x"00003F",x"000382",x"0006E8",x"000A54",x"000DAD",x"0010D2",
		x"0013A1",x"001602",x"0017D4",x"001901",x"001975",x"001921",x"0017FE",x"001609",
		x"00134A",x"000FCD",x"000BA0",x"0006F8",x"0001C5",x"FFFC5C",x"FFF6DB",x"FFF162",
		x"FFEC23",x"FFE74F",x"FFE315",x"FFDF9B",x"FFDD01",x"FFDB63",x"FFDAD3",x"FFDB5F",
		x"FFDD0B",x"FFDFCF",x"FFE39B",x"FFE855",x"FFEDDB",x"FFF407",x"FFFAA9",x"00018B",
		x"000876",x"000F36",x"001597",x"001B5B",x"00205E",x"00246F",x"002770",x"002948",
		x"0029E7",x"002948",x"002770",x"00246F",x"00205E",x"001B5B",x"001597",x"000F36",
		x"000876",x"00018B",x"FFFAA9",x"FFF407",x"FFEDDB",x"FFE855",x"FFE39B",x"FFDFCF",
		x"FFDD0B",x"FFDB5F",x"FFDAD3",x"FFDB63",x"FFDD01",x"FFDF9B",x"FFE315",x"FFE74F",
		x"FFEC23",x"FFF162",x"FFF6DB",x"FFFC5C",x"0001C5",x"0006F8",x"000BA0",x"000FCD",
		x"00134A",x"001609",x"0017FE",x"001921",x"001975",x"001901",x"0017D4",x"001602",
		x"0013A1",x"0010D2",x"000DAD",x"000A54",x"0006E8",x"000382",x"00003F",x"FFFD39",
		x"FFFA84",x"FFF82F",x"FFF644",x"FFF4CB",x"FFF3C6",x"FFF32E",x"FFF2FD",x"FFF325",
		x"FFF396",x"FFF43B",x"FFF4FE",x"FFF5C4",x"FFF66E",x"FFF6DD",x"FFF6EB",x"FFF66D",
		x"001E2F"	
	);
	
	constant COEFFICIENTS_4: tCoeff := (
		x"FFF8BA",x"FFF944",x"FFFA16",x"FFFB20",x"FFFC50",x"FFFD90",x"FFFEC9",x"FFFFE3",
		x"0000C8",x"000164",x"0001A3",x"000177",x"0000D7",x"FFFFBD",x"FFFE2C",x"FFFC29",
		x"FFF9C2",x"FFF70A",x"FFF41A",x"FFF10F",x"FFEE09",x"FFEB2C",x"FFE89D",x"FFE680",
		x"FFE4F9",x"FFE426",x"FFE424",x"FFE508",x"FFE6E0",x"FFE9B3",x"FFED7F",x"FFF239",
		x"FFF7CD",x"FFFE1E",x"000506",x"000C59",x"0013E4",x"001B70",x"0022C2",x"00299E",
		x"002FCA",x"00350E",x"003936",x"003C16",x"003D8A",x"003D76",x"003BCC",x"003887",
		x"0033B1",x"002D5E",x"0025AE",x"001CCE",x"0012F4",x"00085E",x"FFFD52",x"FFF21A",
		x"FFE704",x"FFDC5C",x"FFD26E",x"FFC980",x"FFC1D3",x"FFBB9D",x"FFB70C",x"FFB441",
		x"083894",x"FFB441",x"FFB70C",x"FFBB9D",x"FFC1D3",x"FFC980",x"FFD26E",x"FFDC5C",
		x"FFE704",x"FFF21A",x"FFFD52",x"00085E",x"0012F4",x"001CCE",x"0025AE",x"002D5E",
		x"0033B1",x"003887",x"003BCC",x"003D76",x"003D8A",x"003C16",x"003936",x"00350E",
		x"002FCA",x"00299E",x"0022C2",x"001B70",x"0013E4",x"000C59",x"000506",x"FFFE1E",
		x"FFF7CD",x"FFF239",x"FFED7F",x"FFE9B3",x"FFE6E0",x"FFE508",x"FFE424",x"FFE426",
		x"FFE4F9",x"FFE680",x"FFE89D",x"FFEB2C",x"FFEE09",x"FFF10F",x"FFF41A",x"FFF70A",
		x"FFF9C2",x"FFFC29",x"FFFE2C",x"FFFFBD",x"0000D7",x"000177",x"0001A3",x"000164",
		x"0000C8",x"FFFFE3",x"FFFEC9",x"FFFD90",x"FFFC50",x"FFFB20",x"FFFA16",x"FFF944",
		x"FFF8BA"	
	);
	
	constant COEFFICIENTS: tCoeffArr := (
		COEFFICIENTS_1, COEFFICIENTS_2, COEFFICIENTS_3, COEFFICIENTS_4
	);
--	

--	constant COEFFICIENTS: tCoeff := (
--		x"080000",
--		others=>x"000000"
--	);

	

end package constants;