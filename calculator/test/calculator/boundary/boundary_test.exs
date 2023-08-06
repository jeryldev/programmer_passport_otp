defmodule Calculator.Boundary.BoundaryTest do
  use ExUnit.Case
  alias Calculator.{Boundary.Boundary, Core}

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

  test "receive fold add message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:fold, [1, 2, 3], 0, &Core.add/2})

    assert_receive {:trace, ^pid, :receive, value}
    assert value == {:fold, [1, 2, 3], 0, &Calculator.Core.add/2}
  end

  test "receive fold subtract message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:fold, [1, 2, 3], 0, &Core.subtract/2})

    assert_receive {:trace, ^pid, :receive, value}
    assert value == {:fold, [1, 2, 3], 0, &Calculator.Core.subtract/2}
  end

  test "receive fold multiply message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:fold, [1, 2, 3], 1, &Core.multiply/2})

    assert_receive {:trace, ^pid, :receive, value}
    assert value == {:fold, [1, 2, 3], 1, &Calculator.Core.multiply/2}
  end

  test "receive fold divide message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:fold, [1, 2, 3], 1, &Core.divide/2})

    assert_receive {:trace, ^pid, :receive, value}
    assert value == {:fold, [1, 2, 3], 1, &Calculator.Core.divide/2}
  end

  test "receive clear message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:clear})

    assert_receive {:trace, ^pid, :receive, {:clear}}
  end

  test "receive state message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:state, self()})

    assert_receive {:trace, ^pid, :receive, {:state, state}}
  end

  test "receive unexpected message", %{pid: pid} do
    :erlang.trace(pid, true, [:receive])
    send(pid, {:unexpected})

    assert_receive {:trace, ^pid, :receive, {:unexpected}}
  end
end
