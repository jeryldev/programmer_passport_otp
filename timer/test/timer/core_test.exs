defmodule Timer.CoreTest do
  use ExUnit.Case, async: true
  alias Timer.Core

  test "print/1 prints the time of a given datetime" do
    datetime = DateTime.from_naive!(~N[2018-01-01 00:00:00], "Etc/UTC")

    assert "tick: 00:00:00" == Core.print(datetime)
  end

  test "print/1 prints an error message when given an invalid datetime" do
    datetime = "invalid datetime"

    assert "invalid datetime" == Core.print(datetime)
  end
end
