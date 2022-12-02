defmodule Load do
  def input do
    File.read!("./input.txt")
    |> String.split("\n")
  end
end

defmodule Part1 do
  def countCalories([_], _, max) do
    max
  end

  def countCalories([next_cal | _] = calories, current, max) do
    if next_cal != "" do
      current = current + String.to_integer(next_cal)
      countCalories(tl(calories), current, max)
    else
      max = if current > max, do: current, else: max
      countCalories(tl(calories), 0, max)
    end
  end
end

defmodule Part2 do
  def countCalories([_], _, totals) do
    [a, b, c | _] = Enum.sort(totals, :desc)
    a + b + c
  end

  def countCalories([next_cal | _] = calories, current, totals) do
    if next_cal != "" do
      current = current + String.to_integer(next_cal)
      countCalories(tl(calories), current, totals)
    else
      totals = totals ++ [current]
      countCalories(tl(calories), 0, totals)
    end
  end
end

IO.puts(Part1.countCalories(Load.input(), 0, 0))
IO.puts(Part2.countCalories(Load.input(), 0, []))
