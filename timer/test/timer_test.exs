defmodule TimerTest do
  use ExUnit.Case
  alias Timer
  alias Timer.Boundary.Server

  test "start/0 starts the server" do
    assert {:ok, pid} = Timer.start()
    assert pid == Process.whereis(Server)
  end

  test "reset/0 resets the timer" do
    assert {:ok, pid} = Timer.start()
    assert pid == Process.whereis(Server)
    assert :ok == Timer.reset()
  end
end
