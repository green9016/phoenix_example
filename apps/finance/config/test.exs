use Mix.Config

config :finance, BCT.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bank_platform_#{Mix.env}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

