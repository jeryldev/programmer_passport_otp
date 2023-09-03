defmodule Timer.Boundary.ServerTest do
  use ExUnit.Case
  alias Timer.Boundary.Server

  test "start_link/0 starts the server" do
    assert {:ok, pid} = Server.start_link()
    assert pid == Process.whereis(Server)
  end

  test "handle_info/2 :tick prints the time" do
    assert {:ok, pid} = Server.start_link()
    assert pid == Process.whereis(Server)
    assert {:noreply, %{timer: _timer_reference}} = Server.handle_info(:tick, %{timer: %{}})
  end

  test "handle_info/2 anything else returns :ok" do
    assert {:ok, pid} = Server.start_link()
    assert pid == Process.whereis(Server)
    assert {:ok, %{}} == Server.handle_info(:anything, %{})
  end

  test "reset_timer/0 resets the timer" do
    assert {:ok, pid} = Server.start_link()
    assert pid == Process.whereis(Server)
    assert :ok == Server.reset_timer()
  end
end
