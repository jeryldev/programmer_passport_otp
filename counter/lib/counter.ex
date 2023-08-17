defmodule Counter do
  alias Counter.Boundary.Server

  def start(counter \\ 0), do: Server.start_link(counter)
  def increment(server), do: Server.increment(server)
  def decrement(server), do: Server.decrement(server)
  def state(server), do: Server.state(server)
end
