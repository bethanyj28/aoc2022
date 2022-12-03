defmodule Load do
  def input_part1(file_name) do
    File.read!(file_name)
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      String.split_at(line, div(String.length(line), 2))
    end)
  end

  def input_part2(file_name) do
    File.read!(file_name)
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3)
  end
end

defmodule Part1 do
  def total_priorities(input) do
    Enum.reduce(input, 0, fn {first_compartment, second_compartment}, priority ->
      priority + priority(find_match(first_compartment, second_compartment))
    end)
  end

  defp find_match(first_compartment, second_compartment) do
    Enum.find(String.split(first_compartment, "", trim: true), fn item ->
      String.contains?(second_compartment, item)
    end)
  end

  defp priority(item) do
    item_str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    1 + Enum.find_index(String.split(item_str, "", trim: true), fn item_key ->
      item_key == item
    end)
  end
end

defmodule Part2 do
  def total_priorities(input) do
    Enum.reduce(input, 0, fn group, priority ->
      priority + priority(find_badge(group))
    end)
  end

  defp find_badge(group) do
    [first, second, third] = group
    Enum.find(String.split(first, "", trim: true), fn item ->
      String.contains?(second, item) && String.contains?(third, item)
    end)
  end

  defp priority(item) do
    item_str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    1 + Enum.find_index(String.split(item_str, "", trim: true), fn item_key ->
      item_key == item
    end)
  end
end

IO.puts(inspect(Part1.total_priorities(Load.input_part1("./input.txt"))))
IO.puts(inspect(Part2.total_priorities(Load.input_part2("./input.txt"))))
