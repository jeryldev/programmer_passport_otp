defmodule Calculator.Boundary.Boundary do
  alias Calculator.Core

  def start(initial_state) do
    # <--- init
    spawn(fn -> run(initial_state) end)
  end

  def run(state) do
    state
    |> listen
    |> run
  end

  def listen(state) do
    receive do
      {:add, number} ->
        # <--- handle_cast
        Core.add(state, number)

      {:subtract, number} ->
        # <--- handle_cast
        Core.subtract(state, number)

      {:multiply, number} ->
        # <--- handle_cast
        Core.multiply(state, number)

      {:divide, number} ->
        # <--- handle_cast
        Core.divide(state, number)

      {:negate} ->
        # <--- handle_cast
        Core.negate(state)

      {:inc} ->
        # <--- handle_info as an example only
        Core.inc(state)

      {:clear} ->
        # <--- handle_cast
        0

      {:state, pid} ->
        # <--- handle_call
        send(pid, {:state, state})
        state

      _unexpected ->
        listen(state)
    end
  end
end
