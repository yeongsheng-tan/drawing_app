defmodule DrawingAppTest do
  use ExUnit.Case
  doctest DrawingApp

  test "greets the world" do
    assert DrawingApp.hello() == :world
  end
end
