defmodule Stack.CoreTest do
  use ExUnit.Case, async: true
  alias Stack.Core

  test "push an item to the stack" do
    assert Core.push([2, 3], 1) == [1, 2, 3]
  end

  test "pop an item from the stack" do
    assert Core.pop([1, 2, 3]) == {1, [2, 3]}
  end
end
