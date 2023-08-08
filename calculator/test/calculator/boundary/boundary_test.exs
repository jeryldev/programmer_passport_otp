defmodule Calculator.Boundary.BoundaryTest do
  use ExUnit.Case
  alias Calculator.Boundary.Boundary

  setup do
    initial_state = 0
    pid = Boundary.start(initial_state)
    {:ok, pid: pid, state: initial_state}
  end

  test "receive add message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:add, 1})

    assert_receive {:trace, ^pid, :receive, {:add, value}}
    assert value == 1
  end

  test "receive subtract message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:subtract, 1})

    assert_receive {:trace, ^pid, :receive, {:subtract, value}}
    assert value == 1
  end

  test "receive multiply message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:multiply, 1})

    assert_receive {:trace, ^pid, :receive, {:multiply, value}}
    assert value == 1
  end

  test "receive divide message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:divide, 1})

    assert_receive {:trace, ^pid, :receive, {:divide, value}}
    assert value == 1
  end

  test "receive clear message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:clear})

    assert_receive {:trace, ^pid, :receive, {:clear}}
  end

  test "receive state message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:state, self()})

    assert_receive {:trace, ^pid, :receive, {:state, _state}}
  end

  test "receive unexpected message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:unexpected})

    assert_receive {:trace, ^pid, :receive, {:unexpected}}
  end
end
