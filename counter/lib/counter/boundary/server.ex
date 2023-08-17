defmodule Counter.Boundary.Server do
  use GenServer
  alias Counter.Core

  def start_link(counter \\ 0) do
    GenServer.start_link(__MODULE__, counter)
  end

  def init(counter) do
    {:ok, counter}
  end

  def increment(pid) do
    GenServer.call(pid, :increment)
  end

  def decrement(pid) do
    GenServer.call(pid, :decrement)
  end

  def handle_call(:increment, _from, counter) do
    case Core.increment(counter) do
      {:ok, new_counter} ->
        {:reply, {:ok, new_counter}, new_counter}

      {:error, reason} ->
        {:reply, {:error, reason}, counter}
    end
  end

  def handle_call(:decrement, _from, counter) do
    case Core.decrement(counter) do
      {:ok, new_counter} ->
        {:reply, {:ok, new_counter}, new_counter}

      {:error, reason} ->
        {:reply, {:error, reason}, counter}
    end
  end
end
