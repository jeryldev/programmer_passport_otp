defmodule Calculator do
  alias Calculator.Boundary.Boundary

  def start(initial_state) do
    Boundary.start(initial_state)
  end

  def add(calculator, number), do: send(calculator, {:add, number})
  def subtract(calculator, number), do: send(calculator, {:subtract, number})
  def multiply(calculator, number), do: send(calculator, {:multiply, number})
  def divide(calculator, number), do: send(calculator, {:divide, number})
  def clear(calculator), do: send(calculator, {:clear})

  def state(calculator) do
    send(calculator, {:state, self()})

    receive do
      {:state, state} -> state
    after
      5000 -> {:error, :timeout}
    end
  end
end
