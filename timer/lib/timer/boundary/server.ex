defmodule Timer.Boundary.Server do
  use GenServer
  alias Timer.Core

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def reset_timer do
    GenServer.call(__MODULE__, :reset_timer)
  end

  def init(_args) do
    timer = Process.send_after(self(), :tick, 60_000)

    {:ok, %{timer: timer}}
  end

  def handle_call(:reset_timer, _from, %{timer: timer}) do
    Process.cancel_timer(timer)
    timer = Process.send_after(self(), :tick, 60_000)
    {:reply, :ok, %{timer: timer}}
  end

  def handle_info(:tick, state) do
    datetime = DateTime.utc_now()
    Core.print(datetime)
    timer = Process.send_after(self(), :tick, 60_000)
    {:noreply, %{state | timer: timer}}
  end

  def handle_info(_, state) do
    {:ok, state}
  end
end
