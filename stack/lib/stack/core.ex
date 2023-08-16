defmodule Stack.Core do
  def push(acc, item) do
    [item | acc]
  end

  def pop(acc) do
    [item | new_acc] = acc
    {item, new_acc}
  end
end
