defmodule DrawingApp.CanvasTest do
  use ExUnit.Case
  doctest DrawingApp.Canvas

  test "create a canvas with width 5 and height 4" do
    {:ok, canvas} = DrawingApp.Canvas.new(5, 4)
    assert canvas == %DrawingApp.Canvas{ width: 5,
                                        height: 4,
                                        coordinates: [ %DrawingApp.Coordinate{val: "", x: 1, y: 1},
                                                      %DrawingApp.Coordinate{val: "", x: 1, y: 2},
                                                      %DrawingApp.Coordinate{val: "", x: 1, y: 3},
                                                      %DrawingApp.Coordinate{val: "", x: 1, y: 4},
                                                      %DrawingApp.Coordinate{val: "", x: 2, y: 1},
                                                      %DrawingApp.Coordinate{val: "", x: 2, y: 2},
                                                      %DrawingApp.Coordinate{val: "", x: 2, y: 3},
                                                      %DrawingApp.Coordinate{val: "", x: 2, y: 4},
                                                      %DrawingApp.Coordinate{val: "", x: 3, y: 1},
                                                      %DrawingApp.Coordinate{val: "", x: 3, y: 2},
                                                      %DrawingApp.Coordinate{val: "", x: 3, y: 3},
                                                      %DrawingApp.Coordinate{val: "", x: 3, y: 4},
                                                      %DrawingApp.Coordinate{val: "", x: 4, y: 1},
                                                      %DrawingApp.Coordinate{val: "", x: 4, y: 2},
                                                      %DrawingApp.Coordinate{val: "", x: 4, y: 3},
                                                      %DrawingApp.Coordinate{val: "", x: 4, y: 4},
                                                      %DrawingApp.Coordinate{val: "", x: 5, y: 1},
                                                      %DrawingApp.Coordinate{val: "", x: 5, y: 2},
                                                      %DrawingApp.Coordinate{val: "", x: 5, y: 3},
                                                      %DrawingApp.Coordinate{val: "", x: 5, y: 4}
                                                    ]
                                        }
  end

  test "create a canvas with default width and height" do
    {:ok, canvas} = DrawingApp.Canvas.new()
    assert Enum.member?(canvas.coordinates, %DrawingApp.Coordinate{val: "", x: 1, y: 1})
    assert Enum.member?(canvas.coordinates, %DrawingApp.Coordinate{val: "", x: 25, y: 25})
    assert Enum.member?(canvas.coordinates, %DrawingApp.Coordinate{val: "", x: 50, y: 50})

    refute Enum.member?(canvas.coordinates, %DrawingApp.Coordinate{val: "", x: 0, y: 0})
    refute Enum.member?(canvas.coordinates, %DrawingApp.Coordinate{val: "", x: 51, y: 51})
    refute Enum.member?(canvas.coordinates, %DrawingApp.Coordinate{val: "", x: -1, y: 1})
  end

  test "renders expected canvas with width 3 and height 5" do
    {:ok, canvas} = DrawingApp.Canvas.new(3, 5)
    assert DrawingApp.Canvas.render(canvas) == "-----\n|   |\n|   |\n|   |\n|   |\n|   |\n-----\n"
  end

  test "renders expected canvas with default width and height" do
    {:ok, canvas} = DrawingApp.Canvas.new()
    view = DrawingApp.Canvas.render(canvas)
    assert view == "----------------------------------------------------\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n|                                                  |\n----------------------------------------------------\n"
  end

  test "throws :out_of_allowed_canvas_size error for invalid width and height" do
    assert DrawingApp.Canvas.new(-1,0) == {:error, :out_of_allowed_canvas_size}
  end
end
