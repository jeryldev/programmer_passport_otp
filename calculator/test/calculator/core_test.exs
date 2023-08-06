defmodule Calculator.CoreTest do
  use ExUnit.Case
  doctest Calculator.Core

  test "adds two numbers" do
    assert Calculator.Core.add(1, 2) == 3
  end

  test "subtracts two numbers" do
    assert Calculator.Core.subtract(2, 1) == 1
  end

  test "multiplies two numbers" do
    assert Calculator.Core.multiply(2, 2) == 4
  end

  test "divides two numbers" do
    assert Calculator.Core.divide(4, 2) == 2
  end

  test "fold adds a list of numbers" do
    assert Calculator.Core.fold([1, 2, 3], 0, &Calculator.Core.add/2) == 6
  end

  test "fold subtracts a list of numbers" do
    assert Calculator.Core.fold([1, 2, 3], 0, &Calculator.Core.subtract/2) == -6
  end

  test "fold multiplies a list of numbers" do
    assert Calculator.Core.fold([1, 2, 3], 1, &Calculator.Core.multiply/2) == 6
  end

  test "fold divides a list of numbers" do
    assert Calculator.Core.fold([1, 2, 3], 1, &Calculator.Core.divide/2) == 0.16666666666666666
  end
end
