# FizzbuzzCli

FizzBuzz CLI Tool

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `fizzbuzz_cli` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:fizzbuzz_cli, "~> 0.1.0"}]
    end
    ```

  2. Ensure `fizzbuzz_cli` is started before your application:

    ```elixir
    def application do
      [applications: [:fizzbuzz_cli]]
    end
    ```

## Build

To build the executable run `mix escript.build`

This will generate a fizzbuzz_cli tool that you can run with `./fizzbuzz_cli`

## Running

To calculate FizzBuzz

`./fizzbuzz_cli --number 5`

To favourite a FizzBuzz number

`./fizzbuzz_cli --number 5 --favourite`
