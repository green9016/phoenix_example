use Mix.Config

## Logger
config :logger, level: :debug

## Repo
config :finance, ecto_repos: [BCT.Repo]

import_config "#{Mix.env}.exs"
