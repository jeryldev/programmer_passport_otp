defmodule Calculator.Boundary.Server do
  use GenServer
  alias Calculator.Core

  @doc """
  This module is based of the Calculator.Boundary.Boundary module and is converted to a GenServer.
  """

  def start_link(initial_state) when is_integer(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def init(number) do
    {:ok, number}
  end

  def handle_cast({:add, number}, state) do
    {:noreply, Core.add(state, number)}
  end

  def handle_cast({:subtract, number}, state) do
    {:noreply, Core.subtract(state, number)}
  end

  def handle_cast({:multiply, number}, state) do
    {:noreply, Core.multiply(state, number)}
  end

  def handle_cast({:divide, number}, state) do
    {:noreply, Core.divide(state, number)}
  end

  def handle_cast(:negate, state) do
    {:noreply, Core.negate(state)}
  end

  def handle_cast(:clear, _state) do
    {:noreply, 0}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  def handle_info(:inc, state) do
    {:noreply, Core.inc(state)}
  end

  def add(pid, number), do: GenServer.cast(pid, {:add, number})
  def subtract(pid, number), do: GenServer.cast(pid, {:subtract, number})
  def multiply(pid, number), do: GenServer.cast(pid, {:multiply, number})
  def divide(pid, number), do: GenServer.cast(pid, {:divide, number})
  def inc(pid), do: send(pid, :inc)
  def negate(pid), do: GenServer.cast(pid, :negate)
  def clear(pid), do: GenServer.cast(pid, :clear)
  def state(pid), do: GenServer.call(pid, :state)
end
