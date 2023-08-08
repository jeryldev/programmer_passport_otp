defmodule Calculator.Boundary.ServerTest do
  use ExUnit.Case
  alias Calculator.Boundary.Server

  setup do
    initial_state = 10
    {:ok, server} = Server.start_link(initial_state)
    {:ok, server: server, state: initial_state}
  end

  test "add number to server state", %{server: server, state: state} do
    assert Server.add(server, 1) == :ok
    assert Server.state(server) == state + 1
  end

  test "subtract number from server state", %{server: server, state: state} do
    assert Server.subtract(server, 1) == :ok
    assert Server.state(server) == state - 1
  end

  test "multiply number with server state", %{server: server, state: state} do
    assert Server.multiply(server, 1) == :ok
    assert Server.state(server) == state * 1
  end

  test "divide server state by number", %{server: server, state: state} do
    assert Server.divide(server, 1) == :ok
    assert Server.state(server) == state / 1
  end

  test "negate server state", %{server: server, state: state} do
    assert Server.negate(server) == :ok
    assert Server.state(server) == -state
  end

  test "clear server state", %{server: server} do
    assert Server.clear(server) == :ok
    assert Server.state(server) == 0
  end

  test "get server state", %{server: server, state: state} do
    assert Server.state(server) == state
  end
end
