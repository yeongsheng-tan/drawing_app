defmodule DrawingApp.Canvas do
  alias __MODULE__
  alias DrawingApp.Coordinate

  @enforce_keys [:width, :height, :coordinates]
  defstruct [:width, :height, :coordinates]

  @canvas_range 1..50

  def new(width \\ 50, height \\50)
  def new(width, height) when width in(@canvas_range) and height in(@canvas_range) do
    width_at_boundary = width + 1
    height_at_boundary = height + 1
    coordinates =
      for y <- 0..height_at_boundary, x <- 0..width_at_boundary, into: MapSet.new() do
        cond do
          ((y == 0 || y == height_at_boundary) && x == width_at_boundary)        -> {:ok, coord} = Coordinate.new(x, y, "-\n"); coord
          ((y != 0 || y != height_at_boundary) && x == width_at_boundary)        -> {:ok, coord} = Coordinate.new(x, y, "|\n"); coord
          (x == 0 && y != 0 && y != height_at_boundary)                          -> {:ok, coord} = Coordinate.new(x, y, "|"); coord
          (y == 0 || y == height_at_boundary)                                    -> {:ok, coord} = Coordinate.new(x, y, "-"); coord
          true                                                                   -> {:ok, coord} = Coordinate.new(x, y); coord
        end
      end
    { :ok, %Canvas{width: width, height: height, coordinates: coordinates} }
  end
  def new(_width, _height), do: { :error, :canvas_size_not_allowed }
end
