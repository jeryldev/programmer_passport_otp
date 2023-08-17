defmodule Counter.CoreTest do
  use ExUnit.Case
  alias Counter.Core

  test "increment/1 increments the counter" do
    assert {:ok, 1} = Core.increment(0)
  end

  test "increment/1 returns an error when the counter is not an integer" do
    assert {:error, :invalid_number} = Core.increment(:foo)
  end

  test "decrement/1 decrements the counter" do
    assert {:ok, -1} = Core.decrement(0)
  end

  test "decrement/1 returns an error when the counter is not an integer" do
    assert {:error, :invalid_number} = Core.decrement(:foo)
  end
end
