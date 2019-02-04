defmodule Vantagex.TimeSeries do
  @moduledoc """
  Contains functions related to the Timeseries functions of Alpha Vantage's API.
  """
  alias Vantagex
  @module_id "TIME_SERIES"

  @doc """
  Uses Alpha Vantage's TIME_SERIES_INTRADAY function.
  Returns intraday time series of the equity specified

  Args:

  * `symbol` - The symbol of the stock to use. E.g. `MSFT`
  * `interval` - Interval (in minutes) between two consecutive data points in the time series.
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `outputsize` - `:compact | :full` when set to compact returns the latest 100
  datapoints; when set to full returns the full length intraday time series. Defaults to compact
  * `datatype` - `:json | :csv` specifies the return format. Defaults to JSON
  * `as_map` - `true | false`. If set to true, returns the data as an Elixir Map,
  otherwise the response will be the response body as plain text. Works with `:json`
  datatype. Defaults to `false`
  """
  @spec intraday(String.t(), integer(), Keyword.t()) :: String.t() | Map.t()
  def intraday(symbol, interval, opts \\ []) do
    params = %{
      symbol: symbol,
      interval: "#{interval}min",
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params

    resolve_request(:intraday, params)
  end

  @doc """
  Uses Alpha Vantage's TIME_SERIES_DAILY function.
  Returns daily time series of the equity specified

  Args:

  * `symbol` - The symbol of the stock to use. E.g. `MSFT`
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `outputsize` - `:compact | :full` when set to compact returns the latest 100
  datapoints; when set to full returns the full length intraday time series. Defaults to compact
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  @spec daily(String.t(), Keyword.t()) :: String.t() | Map.t()
  def daily(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params

    resolve_request(:daily, params)
  end

  @doc """
  Uses Alpha Vantage's TIME_SERIES_DAILY_ADJUSTED function.
  Returns daily time series of the equity specified with adjusted close prices.

  Args:

  * `symbol` - The symbol of the stock to use. E.g. `MSFT`
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `outputsize` - `:compact | :full` when set to compact returns the latest 100
  datapoints; when set to full returns the full length intraday time series. Defaults to compact
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  @spec daily_adjusted(String.t(), Keyword.t()) :: String.t() | Map.t()
  def daily_adjusted(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params

    resolve_request(:daily_adjusted, params)
  end

  @doc """
  Uses Alpha Vantage's TIME_SERIES_WEEKLY function.
  Returns weekly time series of the equity specified

  Args:

  * `symbol` - The symbol of the stock to use. E.g. `MSFT`
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  @spec weekly(String.t(), Keyword.t()) :: String.t() | Map.t()
  def weekly(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params

    resolve_request(:weekly, params)
  end

  @doc """
  Uses Alpha Vantage's TIME_SERIES_WEEKLY_ADJUSTED function.
  Returns weekly time series of the equity specified with adjusted close prices.

  Args:

  * `symbol` - The symbol of the stock to use. E.g. `MSFT`
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  @spec weekly_adjusted(String.t(), Keyword.t()) :: String.t() | Map.t()
  def weekly_adjusted(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params

    resolve_request(:weekly_adjusted, params)
  end

  @doc """
  Uses Alpha Vantage's TIME_SERIES_MONTHLY function.
  Returns monthly time series of the equity specified

  Args:

  * `symbol` - The symbol of the stock to use. E.g. `MSFT`
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  @spec monthly(String.t(), Keyword.t()) :: String.t() | Map.t()
  def monthly(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params

    resolve_request(:monthly, params)
  end

  @doc """
  Uses Alpha Vantage's TIME_SERIES_MONTHLY_ADJUSTED function.
  Returns monthly time series of the equity specified with adjusted close prices.

  Args:

  * `symbol` - The symbol of the stock to use. E.g. `MSFT`
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  @spec monthly_adjusted(String.t(), Keyword.t()) :: String.t() | Map.t()
  def monthly_adjusted(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params

    resolve_request(:monthly_adjusted, params)
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

    "#{@module_id}_#{key}"
  end
end
