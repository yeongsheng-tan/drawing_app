defmodule DrawingApp.Painter do
  alias __MODULE__
  alias DrawingApp.{Coordinate, Canvas}

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
