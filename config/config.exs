# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :catter,
  ecto_repos: [Catter.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :catter, CatterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cxikG2yyZe8UGk0a8IU6mJhPGOXuVGe2uwUwM1SNo4BTJIwmibTNtc43jo595RX4",
  render_errors: [view: CatterWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Catter.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :catter, Catter.Guardian,
  issuer: "Catter",
  secret_key: "eW7WQ1Pz4r2U9afF926nT5kPRiRCf4lt99BLSxcU0APszSpvjxFx972mTYLzB2ajabcdef"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
