defmodule Vantagex.Forex do
  @moduledoc """
  Contains functions related to the Forex functions from Alpha Vantage
  """
  alias Vantagex

  @module_id "FX"

  @doc """
  Uses Alpha Vantage's CURRENCY_EXCHANGE_RATE function.
  Returns the realtime exchange rate for any pair of digital currency (e.g. Bitcoin)
  or physical currency (e.g. USD)

  Args:

  * `from_currency` - The currency to get the exchange rate for. e.g. "USD" or "BTC"
  * `to_currency` - The destination currency for the exchange rate. e.g. "USD" or "BTC"
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map

  ## Examples:

      iex> Vantagex.Forex.currency_exchange_rate("USD", "COP")
      %{
        "Realtime Currency Exchange Rate" => %{
          "1. From_Currency Code" => "USD",
          "2. From_Currency Name" => "United States Dollar",
          "3. To_Currency Code" => "COP",
          "4. To_Currency Name" => "Colombian Peso",
          "5. Exchange Rate" => "3130.00000000",
          "6. Last Refreshed" => "2019-02-16 22:33:37",
          "7. Time Zone" => "UTC"
        }
      }
  
      iex> Vantagex.Forex.currency_exchange_rate("USD", "COP", datatype: :json)
      "{\\n    \"Realtime Currency Exchange Rate\": {\\n        \"1. From_Currency Code\": \"USD\",\\n        \"2. From_Currency Name\": \"United States Dollar\",\\n        \"3. To_Currency Code\": \"COP\",\\n        \"4. To_Currency Name\": \"Colombian Peso\",\\n        \"5. Exchange Rate\": \"3130.00000000\",\\n        \"6. Last Refreshed\": \"2019-02-16 22:34:00\",\\n        \"7. Time Zone\": \"UTC\"\\n    }\\n}"
  """
  @spec currency_exchange_rate(String.t(), String.t(), Keyword.t()) :: Map.t() | String.t()
  def currency_exchange_rate(from_currency, to_currency, opts \\ []) do
    params = %{
      from_currency: from_currency,
      to_currency: to_currency,
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(:currency_exchange_rate, params)
  end

  @doc """
  Uses Alpha Vantage `FX_INTRADAY` function.
  Returns intraday time series of the FX currency pair specified

  Args:

  * `from_symbol` - three letter string representing the currency. e.g. `"EUR"`
  * `to_symbol` - three letter string representing the currency. e.g. `"USD"`
  * `interval` - an integer representing the time interval between data points of the time series. e.g. `5`
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `outputsize` - `:compact | :full` when set to compact returns the latest 100
  datapoints; when set to full returns the full length intraday time series. Defaults to compact
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map

  ## Examples

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
  """
  @spec intraday(String.t(), String.t(), integer(), Keyword.t()) :: Map.t() | String.t()
  def intraday(from_symbol, to_symbol, interval, opts \\ []) do
    params = %{
      from_symbol: from_symbol,
      to_symbol: to_symbol,
      interval: "#{interval}min",
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(:intraday, params)
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

  defp add_group_prefix(:currency_exchange_rate, key) , do: key
  defp add_group_prefix(_f, key), do: "#{@module_id}_#{key}"
end
