defmodule FizzbuzzCli do
  def main(args) do
    args |> parse_args |> process
  end

  def parse_args(args) do
    options = OptionParser.parse(args)

    case options do
      {[number: number], _, _} -> [number]
      {[number: number, favourite: true], _, _} -> [number, :favourite]
      {[number: number, unfavourite: true], _, _} -> [number, :unfavourite]
      {[help: true], _, _} -> :help
      _ -> :help
    end
  end

  def process([number]) do
    IO.puts "Calculating FizzBuzz for (#{number})"
    response = HTTPotion.get("http://localhost:3000/v1/fizz_buzzes/#{number}")
    IO.puts "Result: #{response.body}"
  end

  def process([number, :favourite]) do
    IO.puts "Favouriting #{number}"
    response = HTTPotion.post("http://localhost:3000/v1/favourites/", query: %{number: number})
    IO.puts "Result: #{response.body}"
  end

  def process([number, :unfavourite]) do
    IO.puts "Un-Favouriting #{number}"
    response = HTTPotion.delete("http://localhost:3000/v1/favourites/#{number}")
    IO.puts "Result: #{response.body}"
  end

  def process(:help) do
    IO.puts """
      Usage:
      ./fizzbuzz_cli --number [your number]
      ./fizzbuzz_cli --number [your number] --favourite
      ./fizzbuzz_cli --number [your number] --unfavourite

      Options:
      --help  Show this help message.
      --number Calculates FizzBuzz against the number.
      --favourite Stores the number as a favourite.
      --unfavourite Removes the number as a favourite.

      Description:
      CLI tool to calculate FizzBuzz and stores/destroys favourites
    """
  end
end
