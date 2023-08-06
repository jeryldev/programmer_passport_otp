defmodule Calculator.CoreTest do
  use ExUnit.Case
  alias Calculator.Core

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
    assert Calculator.Core.fold([1, 2, 3], 0, &Core.add/2) == 6
  end

  test "fold subtracts a list of numbers" do
    assert Calculator.Core.fold([1, 2, 3], 0, &Core.subtract/2) == -6
  end

  test "fold multiplies a list of numbers" do
    assert Calculator.Core.fold([1, 2, 3], 1, &Core.multiply/2) == 6
  end

  test "fold divides a list of numbers" do
    assert Calculator.Core.fold([1, 2, 3], 1, &Core.divide/2) == 0.16666666666666666
  end

  test "return error when function is not defined in core when folding" do
    assert Calculator.Core.fold([1, 2, 3], 1, &Core.not_defined/2) ==
             {:error, :undefined_function}
  end
end
