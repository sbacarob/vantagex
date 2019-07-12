# Vantagex

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Docs](https://img.shields.io/badge/api-docs-green.svg?style=flat)](https://hexdocs.pm/vantagex/0.1.4) [![Hex.pm Version](https://img.shields.io/hexpm/v/vantagex.svg?style=flat)](https://hex.pm/packages/vantagex)

#### Elixir wrapper for Alpha Vantage API

[Alpha Vantage](https://alphavantage.co) offers free financial APIs in JSON and CSV formats, providing access to realtime and historical stock data. As well as forex and cryptocurrency feeds, and 50+ technical indicators.

## Roadmap

Here's the complete (desired) list of features. Checked items are the ones already implemented.

- [x] Base API with support for all of the Alpha Vantage API params but nothing else
- [x] Dedicated module for Timeseries functions
- [x] Dedicated module for Forex functions
- [x] Dedicated module for the cryptocurrencies functions
- [ ] Dedicated module for the indicators functions
- [ ] 'Watch' option for stocks

## Installation

First, add :vantagex to your deps list in your `mix.exs` file

```elixir
def deps do
  [
    {:vantagex, "~> 0.1"}
  ]
end
```

Then, make sure to add your Alpha Vantage API key to your config files `config.exs` or environment specific, like `dev.exs`

> If you don't have an Alpha Vantage API key, you can get one for free [here](https://www.alphavantage.co/support/#api-key)

```elixir
config :vantagex,
  api_key: "YOUR_API_KEY"
```

Finally run `$ mix deps.get` and you should be good to go.

## Time Series functions

You can call Alpha Vantage's Time Series functions with the `Vantagex.TimeSeries` module:

```elixir
iex> Vantagex.TimeSeries.daily_adjusted("GOOG")
%{
  "Meta Data" => %{
    "1. Information" => "Daily Time Series with Splits and Dividend Events",
    "2. Symbol" => "GOOG",
    "3. Last Refreshed" => "2019-02-08 16:00:01",
    "4. Output Size" => "Compact",
    "5. Time Zone" => "US/Eastern"
  },
  "Time Series (Daily)" => %{
    "2018-11-12" => %{
      "1. open" => "1061.3900",
      "2. high" => "1062.1200",
      "3. low" => "1031.0000",
      "4. close" => "1038.6300",
      "5. adjusted close" => "1038.6300",
      "6. volume" => "1471758",
      "7. dividend amount" => "0.0000",
      "8. split coefficient" => "1.0000"
    },
    "2018-12-06" => %{
      "1. open" => "1034.2600",
      "2. high" => "1071.2000",
      "3. low" => "1030.7700",
      "4. close" => "1068.7300",
      "5. adjusted close" => "1068.7300",
      "6. volume" => "2769225",
      "7. dividend amount" => "0.0000",
      "8. split coefficient" => "1.0000"
    },
    ...
  }
}
```

These functions take the ticker symbol and accept an optional opts object, allowed options are `:outputsize` and `:datatype`. The only function that requires an extra argument is `intraday/3`, which expects the interval as an integer value:

```elixir
iex> Vantagex.TimeSeries.intraday("GOOG", 5) # 5 minute interval
%{
  "Meta Data" => %{
    "1. Information" => "Intraday (5min) open, high, low, close prices and volume",
    "2. Symbol" => "GOOG",
    "3. Last Refreshed" => "2019-02-08 16:00:00",
    "4. Interval" => "5min",
    "5. Output Size" => "Compact",
    "6. Time Zone" => "US/Eastern"
  },
  "Time Series (5min)" => %{
    "2019-02-07 15:50:00" => %{
      "1. open" => "1096.2900",
      "2. high" => "1096.6400",
      "3. low" => "1095.5500",
      "4. close" => "1095.9720",
      "5. volume" => "22465"
    },
    "2019-02-07 14:40:00" => %{
      "1. open" => "1093.5500",
      "2. high" => "1093.9301",
      "3. low" => "1092.7000",
      "4. close" => "1093.0000",
      "5. volume" => "11702"
    },
    ...
  }
}
```

### Output format

As you may notice, these functions return an Elixir Map. This is the default option. However, you can get plaintext JSON or CSV responses, by specifying the `:datatype` option:

```elixir
iex> Vantagex.TimeSeries.intraday("GOOG", 5, datatype: :csv)
"timestamp,open,high,low,close,volume\r\n2019-02-04 16:00:00,1130.7800,1132.4301,1130.5000,1132.4301,122109\r\n2019-02-04 15:55:00,1129.9800,1130.7900,1129.3140,1130.4685,52596\r\n2019-02-04 15:50:00,1129.2600,1130.2520,1128.8500,1129.8600,50110\r\n2019-02-04 15:45:00,1126.7550,1129.4750,1126.7550,1129.4100,33314\r\n2019-02-04 15:40:00,1127.7600,1127.7600,1125.3700,1126.4900,42554\r\n2019-02-04 15:35:00,1130.2900,1130.2900,1127.7006,1127.7006,36706\r\n2019-02-04 15:30:00,1131.1500,1131.5450,1130.3400,1130.6600,17684\r\n2019-02-04 15:25:00,1131.5900,1132.0100,1130.6899,1130.9900,20110\r\n2019-02-04 15:20:00,1130.7800,1131.7999,1130.7130,1131.3280,19301\r\n2019-02-04 15:15:00,1129.8400,1131.5500,1129.8400,1130.5072,36392\r\n2019-02-04 15:10:00,1129.0200,1130.1187,1128.0400,1130.1187,25009\r\n2019-02-04 15:05:00,1129.9000,1129.9998,1128.9301,1129.1600,15658\r\n2019-02-04 15:00:00,1130.0000,1130.4399,1129.7700,1130.0699,21459\r\n2019-02-04 14:55:00,1128.5500,1129.9000,1128.5500,1129.9000,41086\r\n2019-02-04 14:50:00,1128.8400,1128.9718,1127.8025,1128.3900,14609\r\n2019-02-04 14:45:00,1127.6191,1129.0000,1127.6191,1128.5900,12154\r\n..."
```

For more information, see the module's documentation.

## Forex functions.

You can call Alpha Vantage's forex functions using the `Vantagex.Forex` module

```elixir
iex> Vantagex.Forex.intraday("USD", "COP", 5)
%{
  "Meta Data" => %{
    "1. Information" => "FX Intraday (5min) Time Series",
    "2. From Symbol" => "USD",
    "3. To Symbol" => "COP",
    "4. Last Refreshed" => "2019-02-17 22:40:00",
    "5. Interval" => "5min",
    "6. Output Size" => "Compact",
    "7. Time Zone" => "UTC"
  },
  "Time Series FX (5min)" => %{
    "2019-02-17 17:45:00" => %{
      "1. open" => "3130.0000",
      "2. high" => "3130.0000",
      "3. low" => "3130.0000",
      "4. close" => "3130.0000"
    },
    ...
  }
}
```

These functions take two currencies (their ISO 4217 code. e.g. "USD"), as well as options to set
datatype and outputsize, just like TimeSeries.

The only function from `Vantagex.Forex` that requires an extra argument is `intraday/4`, which expects
an integer that determines the interval in minutes, as shown in the example above.

Output format works the same as TimeSeries.

For more information, see the module's documentation.

## Cryptocurrencies functions.

You can call Alpha Vantage's cryptocurrencies functions using the `Vantagex.Cryptocurrencies` module

```elixir
iex> Vantagex.Cryptocurrencies.daily("BTC", "USD")
%{
  "Meta Data" => %{
    "1. Information" => "Daily Prices and Volumes for Digital Currency",
    "2. Digital Currency Code" => "BTC",
    "3. Digital Currency Name" => "Bitcoin",
    "4. Market Code" => "USD",
    "5. Market Name" => "United States Dollar",
    "6. Last Refreshed" => "2019-03-09 (end of day)",
    "7. Time Zone" => "UTC"
  },
  "Time Series (Digital Currency Daily)" => %{
    "2017-07-13" => %{
      "1a. open (USD)" => "2397.70831714",
      "1b. open (USD)" => "2397.70831714",
      "2a. high (USD)" => "2429.55116636",
      "2b. high (USD)" => "2429.55116636",
      "3a. low (USD)" => "2329.24694466",
      "3b. low (USD)" => "2329.24694466",
      "4a. close (USD)" => "2353.72968273",
      "4b. close (USD)" => "2353.72968273",
      "5. volume" => "73837.90295505",
      "6. market cap (USD)" => "173794463.89599040"
    },
    "2018-11-12" => %{
      "1a. open (USD)" => "6404.47988049",
      "1b. open (USD)" => "6404.47988049",
      "2a. high (USD)" => "6435.95061677",
      "2b. high (USD)" => "6435.95061677",
      "3a. low (USD)" => "6359.81993277",
      "3b. low (USD)" => "6359.81993277",
      "4a. close (USD)" => "6375.86047086",
      "4b. close (USD)" => "6375.86047086",
      "5. volume" => "57756.07950395",
      "6. market cap (USD)" => "368244704.26095134"
    },
  ...
  }
}
```

These functions take the digital or crypto currency and the market, as well as options to set
datatype and outputsize, just like TimeSeries.

## Calling the general API function

You can call the base API function, which should support all of the existing APIs provided by Alpha Vantage using `Vantagex.call_api`, like so:

```elixir
# Use the TIME_SERIES_DAILY function
iex> params = %{symbol: "GOOG", outputsize: "full"}
%{outputsize: "full", symbol: "GOOG"}
iex> Vantagex.call_api("TIME_SERIES_DAILY", params)
%{
  "Meta Data" => %{
    "1. Information" => "Daily Prices (open, high, low, close) and Volumes",
    "2. Symbol" => "GOOG",
    "3. Last Refreshed" => "2019-01-04",
    "4. Output Size" => "Full size",
    "5. Time Zone" => "US/Eastern"
  },
  "Time Series (Daily)" => %{
    "2017-07-13" => %{
      "1. open" => "946.2900",
      "2. high" => "954.4500",
      "3. low" => "943.0100",
      "4. close" => "947.1600",
      "5. volume" => "1291782"
    },
    "2018-11-12" => %{
      "1. open" => "1061.3900",
      "2. high" => "1062.1200",
      "3. low" => "1031.0000",
      "4. close" => "1038.6300",
      "5. volume" => "1471758"
    },
    "2018-05-29" => %{
      "1. open" => "1064.8900",
      "2. high" => "1073.3700",
      "3. low" => "1055.2200",
      "4. close" => "1060.3200",
      "5. volume" => "1865139"
    },
    ...
  }
}
```
> Notice that the result has no particular order. This is of the way maps work in Elixir.

You can pass any of the options allowed by Alpha Vantage to the `params` map. However, if you fail to include one of the required params (Except for `apikey` and `function` which should not be passed in `params`), you'll get an error like this:

```elixir
%{
  "Error Message" => "Invalid API call. Please retry or visit the documentation (https://www.alphavantage.co/documentation/) for TIME_SERIES_DAILY."
}
```

Or, in case you attempt to call an unknown function, you'll get a different error message:

```elixir
iex> Vantagex.call_api("TIME_SERIES_QUARTERLY", %{symbol: "GOOG"})
{:error, "Unknown function: 'TIME_SERIES_QUARTERLY'"}
```

## Running the project by itself

To clone and run this project by itself run:

```bash
$ git clone https://github.com/sbacarob/vantagex.git
$ cd vantagex
$ iex -S mix
```
