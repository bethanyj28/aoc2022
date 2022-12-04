defmodule Load do
  def input(file_name) do
    File.read!(file_name)
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      String.split(line, ",", trim: true)
      |> Enum.map(fn line ->
        String.split(line, "-", trim: true)
        |> Enum.map(fn num -> String.to_integer(num) end)
      end)
    end)
  end
end

defmodule Part1 do
  def count_contains(input) do
    Enum.reduce(input, 0, fn [elf1, elf2], count ->
      if is_contained(elf1, elf2) || is_contained(elf2, elf1), do: count + 1, else: count
    end)
  end

  defp is_contained([min_1, max_1], [min_2, max_2]) do
    min_1 <= min_2 && max_1 >= max_2
  end
end

defmodule Part2 do
  def count_overlaps(input) do
    Enum.reduce(input, 0, fn [elf1, elf2], count ->
      if is_overlapped(elf1, elf2) || is_overlapped(elf2, elf1), do: count + 1, else: count
    end)
  end

  defp is_overlapped([min_1, max_1], [min_2, max_2]) do
    (min_1 >= min_2 && min_1 <= max_2) || (max_1 >= min_2 && max_1 <= max_2)
  end
end

#IO.puts(inspect(Part1.count_contains(Load.input("./input.txt"))))
IO.puts(inspect(Part2.count_overlaps(Load.input("./input.txt"))))
