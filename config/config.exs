# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elite_dangerous_ship_designer,
  ecto_repos: [EliteDangerousShipDesigner.Repo]

# Configures the endpoint
config :elite_dangerous_ship_designer, EliteDangerousShipDesigner.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zGC0tSwddcb2VzPWLqqwPSUHOf+fP5dSHCBbOx0X8f8zBWoO/c9Z7Atsg35AvSSz",
  render_errors: [view: EliteDangerousShipDesigner.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EliteDangerousShipDesigner.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
