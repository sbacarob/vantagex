# Vantagex

#### Elixir wrapper for Alpha Vantage API

[Alpha Vantage](https://alphavantage.co) offers free financial APIs in JSON and CSV formats, providing access to realtime and historical stock data. As well as forex and cryptocurrency feeds, and 50+ technical indicators.

## List of features

Here's the complete (desired) list of features. Checked items are the ones already implemented.

- [x] Base API with support for all of the Alpha Vantage API params but nothing else
- [ ] Dedicated module for Timeseries functions
- [ ] Dedicated module for Forex functions
- [ ] Dedicated module for the cryptocurrencies functions
- [ ] Dedicated module for the indicators functions
- [ ] 'Watch' option for stocks

## Installation

```elixir
def deps do
  [
    {:vantagex, git: "https://github.com/sbacarob/vantagex.git"}
  ]
end
```

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
