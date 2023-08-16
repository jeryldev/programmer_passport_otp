defmodule Stack.Boundary.ServerTest do
  use ExUnit.Case, async: true
  alias Stack.Boundary.Server

  test "start_link/0 starts a server with a value" do
    {:ok, pid} = Server.start_link("apple")
    assert pid
    assert Server.state(pid) == ["apple"]
  end

  test "push/2 pushes a value onto the stack" do
    {:ok, pid} = Server.start_link("apple")
    assert Server.push(pid, "banana")
    assert Server.state(pid) == ["banana", "apple"]
  end

  test "pop/1 pops a value off the stack" do
    {:ok, pid} = Server.start_link("apple")
    assert Server.push(pid, "banana")
    assert Server.push(pid, "orange")
    assert Server.state(pid) == ["orange", "banana", "apple"]
    assert Server.pop(pid)
    assert Server.push(pid, "mango")
    assert Server.state(pid) == ["mango", "banana", "apple"]
  end

  test "state/1 returns the state of the server" do
    {:ok, pid} = Server.start_link("apple")
    assert Server.state(pid) == ["apple"]
  end
end
