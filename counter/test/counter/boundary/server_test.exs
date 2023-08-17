defmodule Counter.Boundary.ServerTest do
  use ExUnit.Case
  alias Counter.Boundary.Server

  setup do
    {:ok, server} = Server.start_link(0)
    {:ok, server: server}
  end

  test "increment/1 increments the counter", %{server: server} do
    assert {:ok, 1} = Server.increment(server)
  end

  test "decrement/1 decrements the counter", %{server: server} do
    assert {:ok, -1} = Server.decrement(server)
  end

  test "increment/1 returns an error when the counter is not an integer" do
    {:ok, server} = Server.start_link(:foo)
    assert {:error, :invalid_number} = Server.increment(server)
  end

  test "decrement/1 returns an error when the counter is not an integer" do
    {:ok, server} = Server.start_link(:foo)
    assert {:error, :invalid_number} = Server.decrement(server)
  end

  test "state/1 returns the current state of the counter", %{server: server} do
    assert {:ok, 0} = Server.state(server)
  end
end
