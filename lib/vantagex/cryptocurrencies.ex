defmodule Vantagex.Cryptocurrencies do
  @moduledoc """
  Contains functions related to the Cryptocurrencies functions from Alpha Vantage
  """
  alias Vantagex
  alias Vantagex.Forex

  @module_id "DIGITAL_CURRENCY"

  @doc """
  Uses Alpha Vantage's CURRENCY_EXCHANGE_RATE function.
  Added here for simplicity, but performs a call to `Forex.exchange_rate`

  Args:

  * `from_currency` - The currency to get the exchange rate for. e.g. "BTC"
  * `to_currency` - The destination currency for the exchange rate. e.g. "USD"
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  @spec exchange_rate(String.t(), String.t(), Keyword.t()) :: Map.t() | String.t()
  def exchange_rate(from_currency, to_currency, opts) do
    Forex.exchange_rate(from_currency, to_currency, opts)
  end

  @doc """
  Uses Alpha Vantage's DIGITAL_CURRENCY_DAILY function.
  Returns the daily time series for a digital currency traded on a specific market

  Args:

  * `symbol` - the digital/crypto currency of your choice. any of the currencies in the [digital currency list]("https://www.alphavantage.co/digital_currency_list/")
  * `market` - the exchange market of your choice. any from the [market list]("https://www.alphavantage.co/physical_currency_list/")
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map

  ## Examples:

      iex> Vantagex.Cryptocurrencies.daily("BTC", "USD")
      iex(1)> Vantagex.Cryptocurrencies.daily("BTC", "USD")
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
  """
  @spec daily(String.t(), String.t(), Keyword.t()) :: String.t() | Map.t()
  def daily(symbol, market, opts \\ []) do
    params = %{
      symbol: symbol,
      market: market,
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(:daily, params)
  end

  @doc """
  Uses Alpha Vantage's DIGITAL_CURRENCY_WEEKLY function.
  Returns the daily time series for a digital currency traded on a specific market

  Args:

  * `symbol` - the digital/crypto currency of your choice. any of the currencies in the [digital currency list]("https://www.alphavantage.co/digital_currency_list/")
  * `market` - the exchange market of your choice. any from the [market list]("https://www.alphavantage.co/physical_currency_list/")
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map

  ## Examples

      iex> Vantagex.Cryptocurrencies.weekly("BTC", "USD")
      %{
        "Meta Data" => %{
          "1. Information" => "Weekly Prices and Volumes for Digital Currency",
          "2. Digital Currency Code" => "BTC",
          "3. Digital Currency Name" => "Bitcoin",
          "4. Market Code" => "USD",
          "5. Market Name" => "United States Dollar",
          "6. Last Refreshed" => "2019-03-09 (end of day)",
          "7. Time Zone" => "UTC"
        },
        "Time Series (Digital Currency Weekly)" => %{
          "2018-09-02" => %{
            "1a. open (USD)" => "6727.99365712",
            "1b. open (USD)" => "6727.99365712",
            "2a. high (USD)" => "7314.28946177",
            "2b. high (USD)" => "7314.28946177",
            "3a. low (USD)" => "6656.81489204",
            "3b. low (USD)" => "6656.81489204",
            "4a. close (USD)" => "7277.19919306",
            "4b. close (USD)" => "7277.19919306",
            "5. volume" => "522049.82045400",
            "6. market cap (USD)" => "3694710857.50000000"
          },
          "2016-09-18" => %{
            "1a. open (USD)" => "607.40733392",
            "1b. open (USD)" => "607.40733392",
            "2a. high (USD)" => "612.26786946",
            "2b. high (USD)" => "612.26786946",
            "3a. low (USD)" => "605.42161452",
            "3b. low (USD)" => "605.42161452",
            "4a. close (USD)" => "610.52319377",
            "4b. close (USD)" => "610.52319377",
            "5. volume" => "224699.68643400",
            "6. market cap (USD)" => "136768377.19800001"
          },
          ...
        }
      }
  """
  @spec weekly(String.t(), String.t(), Keyword.t()) :: String.t() | Map.t()
  def weekly(symbol, market, opts \\ []) do
    params = %{
      symbol: symbol,
      market: market,
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(:weekly, params)
  end

  @doc """
  Uses Alpha Vantage's DIGITAL_CURRENCY_MONTHLY function.
  Returns the daily time series for a digital currency traded on a specific market

  Args:

  * `symbol` - the digital/crypto currency of your choice. any of the currencies in the [digital currency list]("https://www.alphavantage.co/digital_currency_list/")
  * `market` - the exchange market of your choice. any from the [market list]("https://www.alphavantage.co/physical_currency_list/")
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map

  ## Examples

      iex> Vantagex.Cryptocurrencies.monthly("BTC", "USD")
      %{
        "Meta Data" => %{
          "1. Information" => "Monthly Prices and Volumes for Digital Currency",
          "2. Digital Currency Code" => "BTC",
          "3. Digital Currency Name" => "Bitcoin",
          "4. Market Code" => "USD",
          "5. Market Name" => "United States Dollar",
          "6. Last Refreshed" => "2019-03-09 (end of day)",
          "7. Time Zone" => "UTC"
        },
        "Time Series (Digital Currency Monthly)" => %{
          "2017-06-30" => %{
            "1a. open (USD)" => "2281.68026573",
            "1b. open (USD)" => "2281.68026573",
            "2a. high (USD)" => "2975.72639337",
            "2b. high (USD)" => "2975.72639337",
            "3a. low (USD)" => "2134.66195666",
            "3b. low (USD)" => "2134.66195666",
            "4a. close (USD)" => "2468.29342943",
            "4b. close (USD)" => "2468.29342943",
            "5. volume" => "3101284.39484000",
            "6. market cap (USD)" => "8096761491.46000004"
          },
          "2018-11-30" => %{
            "1a. open (USD)" => "6341.38852605",
            "1b. open (USD)" => "6341.38852605",
            "2a. high (USD)" => "6555.60352543",
            "2b. high (USD)" => "6555.60352543",
            "3a. low (USD)" => "3559.57432974",
            "3b. low (USD)" => "3559.57432974",
            "4a. close (USD)" => "4012.09235790",
            "4b. close (USD)" => "4012.09235790",
            "5. volume" => "3739720.46008000",
            "6. market cap (USD)" => "18164674672.59999847"
          },
          ...
        }
      }
  """
  @spec monthly(String.t(), String.t(), Keyword.t()) :: String.t() | Map.t()
  def monthly(symbol, market, opts \\ []) do
    params = %{
      symbol: symbol,
      market: market,
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(:monthly, params)
  end

  defp clean_params(params) do
    params
    |> Enum.reject(&(is_nil(elem(&1, 1))))
    |> Map.new()
  end

  defp resolve_request(function, params) do
    function
    |> get_function_name()
    |> Vantagex.call_api(params)
  end

  defp get_function_name(function) do
    key = function
          |> to_string()
          |> String.upcase()

    add_group_prefix(function, key)
  end

  defp add_group_prefix(_f, key), do: "#{@module_id}_#{key}"
end
