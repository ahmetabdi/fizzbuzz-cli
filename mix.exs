defmodule FizzbuzzCli.Mixfile do
  use Mix.Project

  def project do
    [app: :fizzbuzz_cli,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     escript: escript]
  end

  def escript do
    [main_module: FizzbuzzCli]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end
end
