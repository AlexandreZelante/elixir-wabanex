# parei no minuto 54 do primeiro vídeo de liftoff

defmodule Wabanex.IMC do
  def calculate(%{"filename" => filename}) do
    # only the first parameter using pipe operator (|>) is passed implicitly
    # The second you should pass explicitly in function call
    filename
    |> File.read()
    |> handle_file()

    # The code above is the same as the code bellow
    # result = File.read(filename)
    # handle_file(result)
  end

  # defp with p for private function of this module
  defp handle_file({:ok, content}) do
    data =
      content
      |> String.split("\n")
      |> Enum.map(fn line -> parse_line(line) end)
      |> Enum.into(%{})

    {:ok, data}
  end

  # put _ in second parameter because we're not using inside function, only for pattern matching
  defp handle_file({:error, _reason}) do
    {:error, "Error while opening the file"}
  end

  defp parse_line(line) do
    line
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
    |> IO.inspect()
  end

  # Inline function
  defp calculate_imc([name, height, weight]), do: {name, weight / (height * height)}
end
