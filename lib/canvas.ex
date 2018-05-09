defmodule DrawingApp.Canvas do
  alias __MODULE__
  alias DrawingApp.Coordinate

  # @enforce_keys [:width, :height, :view]
  # defstruct [:width, :height, :view]
  @enforce_keys [:width, :height, :coordinates]
  defstruct [:width, :height, :coordinates]

  @canvas_range 1..50

  def new(width \\ 50, height \\50)
  def new(width, height) when width in(@canvas_range) and height in(@canvas_range) do
    # { :ok, %Canvas{width: width, height: height, view: draw_canvas(width, height)} }
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
  def new(_width, _height), do: { :error, :out_of_allowed_canvas_size }

  def render(%Canvas{} = canvas) do
    Enum.join([
      draw_top_bottom_margin(canvas.width),
      draw_body(canvas.width, canvas.height),
      draw_top_bottom_margin(canvas.width)
    ])
  end

  def draw_top_bottom_margin(width) do
    String.duplicate("-", width + 2) <> "\n"
  end

  def draw_body(width, height) do
    Enum.reduce(1..height, "", fn(_x, row_acc) -> draw_row(width) <> row_acc end)
  end

  def draw_row(width) do
    Enum.join(["|", String.duplicate(" ", width), "|", "\n"])
  end
end
