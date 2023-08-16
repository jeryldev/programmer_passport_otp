defmodule StackTest do
  use ExUnit.Case
  alias Stack

  setup do
    initial_state = "apple"
    server = Stack.start(initial_state)

    {:ok, server: server, state: initial_state}
  end

  test "push", %{server: server, state: state} do
    Stack.push(server, "banana")
    assert Stack.state(server) == ["banana", "apple"]
  end

  test "pop", %{server: server, state: state} do
    Stack.push(server, "banana")
    Stack.push(server, "cherry")
    Stack.push(server, "date")
    assert Stack.state(server) == ["date", "cherry", "banana", "apple"]
    assert Stack.pop(server) == "date"
    assert Stack.state(server) == ["cherry", "banana", "apple"]
  end

  test "state", %{server: server, state: state} do
    assert Stack.state(server) == ["apple"]
  end
end
