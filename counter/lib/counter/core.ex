defmodule Counter.Core do
  def increment(counter) when is_integer(counter), do: {:ok, counter + 1}
  def increment(_counter), do: {:error, :invalid_number}
  def decrement(counter) when is_integer(counter), do: {:ok, counter - 1}
  def decrement(_counter), do: {:error, :invalid_number}
end
