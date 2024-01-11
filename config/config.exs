# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :prop_odds_api, base_url: System.get_env("PROP_ODDS_API_BASE_URI")

config :prop_odds_api, api_key: System.get_env("PROP_ODDS_API_KEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
#
# import_config "#{config_env()}.exs"
