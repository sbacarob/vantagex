# Vantagex

#### Elixir wrapper for Alpha Vantage API

[Alpha Vantage](https://alphavantage.co) offers free financial APIs in JSON and CSV formats, providing access to realtime and historical stock data. As well as forex and cryptocurrency feeds, and 50+ technical indicators.

## List of features

Here's the complete (desired) list of features. Checked items are the ones already implemented.

- [ ] Base API with support for all of the Alpha Vantage API params but nothing else
- [ ] Dedicated functions for Timeseries functions
- [ ] Dedicated functions for Forex endpoints
- [ ] Dedicated functions for the cryptocurrencies functions
- [ ] Dedicated functions for the indicators functions
- [ ] 'Watch' option for stocks

## Installation

```elixir
def deps do
  [
    {:vantagex, git: "https://github.com/sbacarob/vantagex.git"}
  ]
end
```

## Running the project by itself

To clone and run this project by itself run:

```bash
$ git clone https://github.com/sbacarob/vantagex.git
$ cd vantagex
$ iex -S mix
```
