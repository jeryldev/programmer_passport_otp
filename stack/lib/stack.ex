defmodule Stack do
  alias Stack.Boundary.Server

  def start(initial_state \\ "") do
    {:ok, server} = Server.start_link(initial_state)
    server
  end

  def push(server, item), do: Server.push(server, item)
  def pop(server), do: Server.pop(server)
  def state(server), do: Server.state(server)
end
