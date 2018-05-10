defmodule DrawingApp.CLI do
  alias __MODULE__
  alias DrawingApp.{Coordinate, Canvas, Painter}

  def main(_args) do
    IO.puts "Welcome to the Drawing App"
    print_help_message()
    receive_command()
  end

  @commands %{
    "Q" => "Quits the program",
    "C" => "format: \"C w h\". " <>
           "Creates a new canvas of width w and height h. " <>
           "Max canvas size 50x50. " <>
           "If w and/or h not provided, canvas defaults to 50x50"
  }

  defp receive_command do
    IO.gets("enter command: ")
    |> String.trim()
    |> String.upcase()
    |> String.split(" ")
    |> execute_command
  end

  defp execute_command(["Q"]) do
    IO.puts "\nBye!"
  end

  defp execute_command(["C" | params]) do
    {width, height} = process_new_canvas_params(params)

    case Canvas.new(width, height) do
      {:ok, canvas} ->
        IO.puts Painter.render(canvas)
        receive_command()
      {:error, message} ->
        IO.puts message
        receive_command()
    end
  end

  defp execute_command(_unknown) do
    IO.puts("\nInvalid command. I don't know what to do.")
    print_help_message()

    receive_command()
  end

  defp process_new_canvas_params([w, h]) do
    {String.to_integer(w), String.to_integer(h)}
  end

  defp process_new_canvas_params([]) do
    {50,50}
  end

  defp print_help_message do
    IO.puts("\nThe Drawing App supports the following commands:\n")
    @commands
    |> Enum.map(fn({command, description}) -> IO.puts("  #{command} - #{description}") end)
  end
end
