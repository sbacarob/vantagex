defmodule Vantagex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :vantagex,
      version: "0.1.4",
      description: "Elixir wrapper for Alpha Vantage API",
      package: package(),
      elixir: "~> 1.7",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      source_url: "https://github.com/sbacarob/vantagex"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/sbacarob/vantagex"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:jason, "~> 1.1"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
