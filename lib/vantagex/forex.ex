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
