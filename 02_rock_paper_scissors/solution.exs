defmodule Load do
  def input do
    File.read!("./input.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
        String.split(line)
    end)
  end
end

defmodule Part1 do
  def evaluate_guide() do
    input = Load.input()

    final_score = Enum.reduce(input, 0, fn [opponent, you], score ->
      round =
        case you do
          "X" ->
            case opponent do
              "A" -> 1 + 3 # draw
              "C" -> 1 + 6 # win
              _ -> 1 + 0
            end
          "Y" ->
            case opponent do
              "B" -> 2 + 3 # draw
              "A" -> 2 + 6 # win
              _ -> 2 + 0
            end
          "Z" ->
            case opponent do
              "C" -> 3 + 3 # draw
              "B" -> 3 + 6 # win
              _ -> 3 + 0
            end
        end

      score + round
    end)

    IO.puts(inspect(final_score))
  end
end

defmodule Part2 do
  def evaluate_guide() do
    input = Load.input()

    final_score = Enum.reduce(input, 0, fn [opponent, you], score ->
      round =
        case you do
          "X" -> # lose
            case opponent do
              "A" -> 3
              "B" -> 1
              "C" -> 2
            end
          "Y" -> # draw
            case opponent do
              "A" -> 3 + 1
              "B" -> 3 + 2
              "C" -> 3 + 3
            end
          "Z" -> # win
            case opponent do
              "A" -> 6 + 2
              "B" -> 6 + 3
              "C" -> 6 + 1
            end
        end

      score + round
    end)

    IO.puts(inspect(final_score))
  end
end

Part1.evaluate_guide()
Part2.evaluate_guide()
