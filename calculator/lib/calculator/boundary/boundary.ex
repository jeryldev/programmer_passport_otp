defmodule Calculator.Boundary.Boundary do
  alias Calculator.Core

  def listen(state) do
    receive do
      {:add, number} ->
        Core.add(state, number)

      {:subtract, number} ->
        Core.subtract(state, number)

      {:multiply, number} ->
        Core.multiply(state, number)

      {:divide, number} ->
        Core.divide(state, number)

      {:fold, list, acc, function} ->
        Core.fold(list, acc, function)

      {:clear} ->
        0

      {:state, pid} ->
        send(pid, {:state, state})
        state

      unexpected ->
        IO.puts("Unexpected message: #{inspect(unexpected)}")
        listen(state)
    end
  end

  def run(state) do
    state
    |> listen
    |> run
  end

  def start(initial_state) do
    spawn(fn -> run(initial_state) end)
  end
end
