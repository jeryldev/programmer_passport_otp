defmodule CounterTest do
  use ExUnit.Case
  alias Counter

  setup do
    {:ok, server} = Counter.start()
    {:ok, server: server}
  end

  test "start/0 starts a counter with the given value" do
    {:ok, server} = Counter.start(1)
    assert {:ok, 1} = Counter.state(server)
  end

  test "increment/1 increments the counter", %{server: server} do
    assert {:ok, 1} = Counter.increment(server)
  end

  test "decrement/1 decrements the counter", %{server: server} do
    assert {:ok, -1} = Counter.decrement(server)
  end

  test "increment/1 returns an error when the counter is not an integer" do
    {:ok, server} = Counter.start(:foo)
    assert {:error, :invalid_number} = Counter.increment(server)
  end

  test "decrement/1 returns an error when the counter is not an integer" do
    {:ok, server} = Counter.start(:foo)
    assert {:error, :invalid_number} = Counter.decrement(server)
  end

  test "state/1 returns the current state of the counter", %{server: server} do
    assert {:ok, 0} = Counter.state(server)
  end
end
