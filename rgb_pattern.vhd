LIBRARY IEEE;
LIBRARY UNISIM;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE UNISIM.VCOMPONENTS.ALL;
USE work.graphics.ALL;

ENTITY rgb_pattern IS
    port( clk_i     : IN  std_logic;
          hsync_i   : IN  std_logic;
          vsync_i   : IN  std_logic;
          blank_i   : IN  std_logic;
          pixel_pos : IN  std_logic_vector(20 downto 0); -- 1920*1080 needs minimum 21 bits
          hsync_o   : OUT std_logic;
          vsync_o   : OUT std_logic;
          blank_o   : OUT std_logic;
          red_o     : OUT std_logic_vector(7 downto 0);
          green_o   : OUT std_logic_vector(7 downto 0);
          blue_o    : OUT std_logic_vector(7 downto 0));
END ENTITY rgb_pattern;

ARCHITECTURE rgb_pattern_a OF rgb_pattern IS
    SIGNAL rainbow: colors(0 to 7) := (x"FF0000", x"FF7F00", x"FFFF00", x"00FF00", x"0000FF", x"4B0082", x"9400D3", x"000000");
    SIGNAL pos_x: integer range 0 to 800;
    SIGNAL pos_y: integer range 0 to 525;

BEGIN
  pos_x <= to_integer(unsigned(pixel_pos)) mod 800;
  pos_y <= to_integer(unsigned(pixel_pos)) / 800;
  
  draw: process(clk_i)
  --VARIABLE index: integer range 0 to 640 := 0;
  VARIABLE funct_colors: std_logic_vector(23 downto 0); 
  BEGIN
      IF (rising_edge(clk_i)) THEN
          hsync_o <= hsync_i;
          vsync_o <= vsync_i;
      
          IF (blank_i = '0') THEN  
              --index := horizontal_lines(pos_x);
              --index := vertical_lines(pos_y);
              --funct_colors := pixel(pos_x, pos_y, 320, 240, rainbow(2), rainbow(6));
              --funct_colors := square(pos_x, pos_y, 190, 270, 100, rainbow(2), rainbow(4));
              --funct_colors := rectangle(pos_x, pos_y, 220, 190, 200, 100, rainbow(4), rainbow(1));
            
              funct_colors := rainbow(0); -- just background color
            
              red_o   <= funct_colors(23 downto 16);
              green_o <= funct_colors(15 downto 8);
              blue_o  <= funct_colors(7 downto 0); 
              blank_o <= '0';
          ELSE
              red_o   <= (OTHERS => '0');
              green_o <= (OTHERS => '0');
              blue_o  <= (OTHERS => '0');   
              blank_o <= '1';
          END IF;
      END IF;
  END PROCESS;
END ARCHITECTURE rgb_pattern_a;