defmodule Timer do
  alias Timer.Boundary.Server

  def start, do: Server.start_link()
  def reset, do: Server.reset_timer()
end
