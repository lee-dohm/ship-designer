use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ship_designer, ShipDesigner.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ship_designer, ShipDesigner.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ship_designer",
  password: "ship_designer",
  database: "ship_designer_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
