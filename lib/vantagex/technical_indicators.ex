defmodule Vantagex.TechnicalIndicators do
  @moduledoc """
  Contains functions related to the technical indicator functions from Alpha Vantage
  """

  import Vantagex.Helper

  @doc """
  Uses Alpha Vantage's SMA function.
  Returns the simple moving average (SMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def sma(symbol, interval, time_period, opts \\ []) do
    params = %{
      symbol: symbol,
      interval: parse_interval(interval),
      time_period: time_period,
      series_type: parse_series_type(Keyword.get(opts, :series_type)),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(:sma, params)
  end
end
