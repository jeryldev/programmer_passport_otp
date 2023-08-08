defmodule Calculator do
  alias Calculator.Boundary.Server

  def start(initial_state) do
    {:ok, calculator} = Server.start_link(initial_state)
    calculator
  end

  def add(calculator, number), do: Server.add(calculator, number)
  def subtract(calculator, number), do: Server.subtract(calculator, number)
  def multiply(calculator, number), do: Server.multiply(calculator, number)
  def divide(calculator, number), do: Server.divide(calculator, number)
  def negate(calculator), do: Server.negate(calculator)
  def clear(calculator), do: Server.clear(calculator)
  def state(calculator), do: Server.state(calculator)
end
