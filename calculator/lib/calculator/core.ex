defmodule Calculator.Core do
  def add(acc, number), do: acc + number
  def subtract(acc, number), do: acc - number
  def multiply(acc, number), do: acc * number
  def divide(acc, number), do: acc / number

  def fold(list, acc, function) do
    Enum.reduce(list, acc, fn item, acc -> function.(acc, item) end)
  end
end
