defmodule CalculatorTest do
  use ExUnit.Case
  alias Calculator

  setup do
    initial_state = 10
    server = Calculator.start(initial_state)
    {:ok, server: server, state: initial_state}
  end

  test "add number to calculator state", %{server: server, state: state} do
    assert Calculator.add(server, 1) == :ok
    assert Calculator.state(server) == state + 1
  end

  test "subtract number from calculator state", %{server: server, state: state} do
    assert Calculator.subtract(server, 1) == :ok
    assert Calculator.state(server) == state - 1
  end

  test "multiply number with calculator state", %{server: server, state: state} do
    assert Calculator.multiply(server, 1) == :ok
    assert Calculator.state(server) == state * 1
  end

  test "divide calculator state by number", %{server: server, state: state} do
    assert Calculator.divide(server, 1) == :ok
    assert Calculator.state(server) == state / 1
  end

  test "negate calculator state", %{server: server, state: state} do
    assert Calculator.negate(server) == :ok
    assert Calculator.state(server) == -state
  end

  test "increment calculator state", %{server: server, state: state} do
    assert Calculator.inc(server) == :ok
    assert Calculator.state(server) == state + 1
  end

  test "clear calculator state", %{server: server} do
    assert Calculator.clear(server) == :ok
    assert Calculator.state(server) == 0
  end

  test "get calculator state", %{server: server, state: state} do
    assert Calculator.state(server) == state
  end
end
