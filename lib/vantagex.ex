defmodule Vantagex do
  @moduledoc """
  Documentation for Vantagex.
  """
  alias Vantagex.HttpClient
  alias Vantagex.Config
  @allowed_params Config.allowed_params
  @allowed_functions Config.allowed_functions

  @doc """
  Call Alpha Vantage API.

  Args:

  * `function` - The function parameter of the API. e.g. TIME_SERIES_DAILY
  * `params` - The parameters to pass along to the request

  ## Examples:

      iex> params = %{symbol: "GOOG"}
      %{symbol: "GOOG"}
      iex> Vantagex.call_api("TIME_SERIES_DAILY", %{})
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
          ...
        }
      }
  """
  @spec call_api(function :: String.t(), params :: Map.t()) :: term()
  def call_api(function, params) when function in @allowed_functions do
    params
    |> curate_params()
    |> Map.merge(%{function: function})
    |> HttpClient.get_data()
  end
  def call_api(function, _), do: {:error, "Unknown function: '#{function}'"}

  defp curate_params(params), do: Map.take(params, @allowed_params)
end
