defmodule FizzbuzzCli do
  def main(args) do
    args |> parse_args |> process
  end

  def parse_args(args) do
    options = OptionParser.parse(args)

    case options do
      {[number: number], _, _} -> [number]
      {[number: number, favourite: favourite], _, _} -> [number, favourite]
      {[help: true], _, _} -> :help
      _ -> :help
    end
  end

  def process([number]) do
    IO.puts "Process! #{number}"
  end

  def process([number, favourite]) do
    IO.puts "Favouriting #{number}"
  end

  def process(:help) do
    IO.puts """
      Usage:
      ./fizzbuzz_cli --number [your number]

      Options:
      --help  Show this help message.
      --number Calculates FizzBuzz against the number.
      --favourite Stores the number as a favourite.

      Description:
      CLI tool to calculate FizzBuzz and store favourites
    """
  end
end
