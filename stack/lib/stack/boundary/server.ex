defmodule Stack.Boundary.Server do
  use GenServer
  alias Stack.Core

  def start_link(default) when is_binary(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def state(pid) do
    GenServer.call(pid, :state)
  end

  @impl true
  def init(elements) do
    initial_state = String.split(elements, ",", trim: true)
    {:ok, initial_state}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, Core.push(state, element)}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    {item, new_state} = Core.pop(state)
    {:reply, item, new_state}
  end

  @impl true
  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end
end
