defmodule PropOddsAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :prop_odds_api,
      version: "0.0.2",
      elixir: "~> 1.14",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      name: "PropOddsApi",
      package: package(),
      description: """
       The Prop Odds API allows you to query player and game prop odds from different bookies.
      """,
      authors: ["Christopher (gk-per)"],
      source_url: "https://github.com/gk-per/prop_odds_api",
      deps: deps(),
      docs: [
        main: "readme",
        source_ref: "main",
        extras: ["README.md", "CHANGELOG.md", "LICENSE"]
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.3.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:tesla, "~> 1.7"},
      {:jason, "~> 1.4"},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      name: "prop_odds_api",
      files: ~w(.formatter.exs config lib mix.exs README* LICENSE* CHANGELOG*),
      links: %{"GitHub" => "https://github.com/gk-per/prop_odds_api"},
      licenses: ["MIT"],
      maintainers: ["Christopher (gk-per)"]
    ]
  end
end
