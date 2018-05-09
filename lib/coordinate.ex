defmodule DrawingApp.Coordinate do
  alias __MODULE__

  @enforce_keys [:x, :y, :val]
  defstruct [:x, :y, :val]

  def new(x, y, val \\ " ")
  def new(x, y, val) when x >= 0 and y >= 0, do:
    {:ok, %Coordinate{x: x, y: y, val: val}}

  def new(_x, _y, _val), do: {:error, :invalid_coordinate}
end
