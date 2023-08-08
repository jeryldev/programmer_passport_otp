defmodule Calculator.Core do
  def add(acc, number), do: acc + number
  def subtract(acc, number), do: acc - number
  def multiply(acc, number), do: acc * number
  def divide(acc, number), do: acc / number

  def fold(list, acc, function) do
    if function_exists?(function),
      do: Enum.reduce(list, acc, fn item, acc -> function.(acc, item) end),
      else: {:error, :undefined_function}
  end

  def negate(acc), do: acc * -1

  def inc(acc), do: acc + 1

  defp function_exists?(function_ref) do
    function = Function.info(function_ref)[:name]
    function in [:add, :subtract, :multiply, :divide]
  end
end
