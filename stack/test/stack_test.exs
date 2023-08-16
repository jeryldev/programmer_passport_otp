defmodule StackTest do
  use ExUnit.Case
  alias Stack

  setup do
    initial_state = "apple"
    server = Stack.start(initial_state)

    {:ok, server: server}
  end

  test "start without initial state" do
    server = Stack.start()
    assert server
    assert Stack.state(server) == []
  end

  test "push", %{server: server} do
    Stack.push(server, "banana")
    assert Stack.state(server) == ["banana", "apple"]
  end

  test "pop", %{server: server} do
    Stack.push(server, "banana")
    Stack.push(server, "cherry")
    Stack.push(server, "date")
    assert Stack.state(server) == ["date", "cherry", "banana", "apple"]
    assert Stack.pop(server) == "date"
    assert Stack.state(server) == ["cherry", "banana", "apple"]
  end

  test "state", %{server: server} do
    assert Stack.state(server) == ["apple"]
  end
end
