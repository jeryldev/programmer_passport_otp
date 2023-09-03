defmodule Timer.Core do
  def print(%DateTime{} = datetime), do: IO.inspect("tick: #{DateTime.to_time(datetime)}")
  def print(_), do: IO.inspect("invalid datetime")
end
