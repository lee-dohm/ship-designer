# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ship_designer,
  ecto_repos: [ShipDesigner.Repo]

# Configures the endpoint
config :ship_designer, ShipDesigner.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zGC0tSwddcb2VzPWLqqwPSUHOf+fP5dSHCBbOx0X8f8zBWoO/c9Z7Atsg35AvSSz",
  render_errors: [view: ShipDesigner.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ShipDesigner.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure Phoenix model generators to use UUIDs
config :phoenix, :generators,
  binary_id: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
