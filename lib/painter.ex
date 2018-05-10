defmodule DrawingApp.Painter do
  alias __MODULE__
  alias DrawingApp.{Coordinate, Canvas}

  def render(%Canvas{width: _, height: _, coordinates: coords}) do
    # Enum.each(coords, fn(coord) -> IO.inspect coord end)
    Enum.reduce(coords, "", fn(coord, bitmap) -> bitmap <> coord.val end)
  end
end
