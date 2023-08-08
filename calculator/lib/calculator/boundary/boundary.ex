defmodule Calculator.Boundary.Boundary do
  alias Calculator.Core


  def start(initial_state) do
    spawn(fn -> run(initial_state) end) # <--- init
  end

  def run(state) do
    state
    |> listen
    |> run
  end

  def listen(state) do
    receive do
      {:add, number} ->
        Core.add(state, number) # <--- handle_cast

      {:subtract, number} ->
        Core.subtract(state, number) # <--- handle_cast

      {:multiply, number} ->
        Core.multiply(state, number) # <--- handle_cast

      {:divide, number} ->
        Core.divide(state, number) # <--- handle_cast

      {:fold, list, acc, function} ->
        Core.fold(list, acc, function) # <--- handle_cast

      {:clear} ->
        0 # <--- handle_cast

      {:state, pid} ->
        send(pid, {:state, state}) # <--- handle_call
        state

      unexpected ->
        IO.puts("Unexpected message: #{inspect(unexpected)}")
        listen(state)
    end
  end
end
