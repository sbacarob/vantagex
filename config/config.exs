use Mix.Config

config :vantagex,
  api_url: "https://www.alphavantage.co/query"

import_config "#{Mix.env}.exs"
