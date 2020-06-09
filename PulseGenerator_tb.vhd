library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_tb is
end entity;

architecture testbench of fsm_tb is
  component fsm
    port (
      clk, rst: in std_logic;
      Pulse : out std_logic
    );
  end component;

  -- skip
  signal clk, rst, Pulse : std_logic;
  constant clk_period : time := 10 ns;
  signal stop : boolean;

begin
  uut : fsm port map (
    clk => clk, rst => rst, Pulse => Pulse
  );

  clk_process: process
  begin
    while not stop loop
      clk <= '0'; wait for clk_period/2;
      clk <= '1'; wait for clk_period/2;
    end loop;
    wait;
  end process;

  stim_proc : process
  begin
    assert Pulse = '0';
    wait until rising_edge(clk);
    assert Pulse = '1';
  end process;
end architecture;