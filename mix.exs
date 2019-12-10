defmodule BroadwayErrorRepro.MixProject do
  use Mix.Project

  def project do
    [
      app: :broadway_error_repro,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BroadwayErrorRepro.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:broadway,
       github: "plataformatec/broadway", ref: "38a504a13a570858cac43178af984760e7611748"}
    ]
  end
end
