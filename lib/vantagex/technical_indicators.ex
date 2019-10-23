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
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def sma(symbol, interval, time_period, opts \\ []) do
    type_1_function(:sma, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's EMA function.
  Returns the exponential moving average (EMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ema(symbol, interval, time_period, opts \\ []) do
    type_1_function(:ema, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's WMA function.
  Returns the weighted moving average (WMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def wma(symbol, interval, time_period, opts \\ []) do
    type_1_function(:wma, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's DEMA function.
  Returns the double exponential moving average (DEMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def dema(symbol, interval, time_period, opts \\ []) do
    type_1_function(:dema, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's TEMA function.
  Returns the triple exponential moving average (TEMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def tema(symbol, interval, time_period, opts \\ []) do
    type_1_function(:tema, symbol, interval, time_period, opts)
  end

  @doc """
  Alias for TEMA. Check `tema/4` for documentation.
  """
  def t3(symbol, interval, time_period, opts \\ []), do: tema(symbol, interval, time_period, opts)

  @doc """
  Uses Alpha Vantage's TRIMA function.
  Returns the triangular moving average (TRIMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def trima(symbol, interval, time_period, opts \\ []) do
    type_1_function(:trima, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's KAMA function.
  Returns the Kaufman adaptive moving average (KAMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def kama(symbol, interval, time_period, opts \\ []) do
    type_1_function(:kama, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's RSI function.
  Returns the relative strength index (RSI) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def rsi(symbol, interval, time_period, opts \\ []) do
    type_1_function(:rsi, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's WILLR function.
  Returns the Williams' %R (WILLR) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def willr(symbol, interval, time_period, opts \\ []) do
    type_1_function(:willr, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's ADX function.
  Returns the average directional movement index (ADX) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def adx(symbol, interval, time_period, opts \\ []) do
    type_1_function(:adx, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's ADXR function.
  Returns the average directional movement index rating (ADXR) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def adxr(symbol, interval, time_period, opts \\ []) do
    type_1_function(:adxr, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's MOM function.
  Returns the momentum (MOM) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def mom(symbol, interval, time_period, opts \\ []) do
    type_1_function(:mom, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's CCI function.
  Returns the commodity channel index (CCI) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def cci(symbol, interval, time_period, opts \\ []) do
    type_1_function(:cci, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's CMO function.
  Returns the Chandem momentum oscillator (CMO) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def cmo(symbol, interval, time_period, opts \\ []) do
    type_1_function(:cmo, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's ROC function.
  Returns the rate of change (ROC) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def roc(symbol, interval, time_period, opts \\ []) do
    type_1_function(:roc, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's ROCR function.
  Returns the rate of change ratio (ROCR) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def rocr(symbol, interval, time_period, opts \\ []) do
    type_1_function(:rocr, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's AROON function.
  Returns the Aroon (AROON) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def aroon(symbol, interval, time_period, opts \\ []) do
    type_1_function(:aroon, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's AROONOSC function.
  Returns the Aroon oscillator (AROONOSC) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def aroonosc(symbol, interval, time_period, opts \\ []) do
    type_1_function(:aroonosc, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's TRIX function.
  Returns the 1-day rate of change of a triple smooth exponential moving average (TRIX) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def trix(symbol, interval, time_period, opts \\ []) do
    type_1_function(:trix, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's DX function.
  Returns the directional movement index (DX) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def dx(symbol, interval, time_period, opts \\ []) do
    type_1_function(:dx, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's MINUS_DI function.
  Returns the minus directional indicator (MINUS_DI) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def minus_di(symbol, interval, time_period, opts \\ []) do
    type_1_function(:minus_di, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's PLUS_DI function.
  Returns the plus directional indicator (PLUS_DI) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def plus_di(symbol, interval, time_period, opts \\ []) do
    type_1_function(:plus_di, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's MINUS_DM function.
  Returns the minus directional movement (MINUS_DM) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def minus_dm(symbol, interval, time_period, opts \\ []) do
    type_1_function(:minus_dm, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's PLUS_DM function.
  Returns the plus directional movement (PLUS_DM) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def plus_dm(symbol, interval, time_period, opts \\ []) do
    type_1_function(:plus_dm, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's MIDPOINT function.
  Returns the midpoint (MIDPOINT) values. `MIDPOINT = (highest value + lowest value) / 2`

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  Defaults to `:close`.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def midpoint(symbol, interval, time_period, opts \\ []) do
    type_1_function(:midpoint, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's MIDPRICE function.
  Returns the midpoint price (MIDPRICE) values. `MIDPRICE = (highest high + lowest low) / 2`

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def midprice(symbol, interval, time_period, opts \\ []) do
    type_1_function(:midprice, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's ATR function.
  Returns the average true range (ATR) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def atr(symbol, interval, time_period, opts \\ []) do
    type_1_function(:atr, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's NATR function.
  Returns the normalized average true range (NATR) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def natr(symbol, interval, time_period, opts \\ []) do
    type_1_function(:natr, symbol, interval, time_period, opts)
  end

  defp type_1_function(func, symbol, interval, time_period, opts) do
    params = %{
      symbol: symbol,
      interval: parse_interval(interval),
      time_period: time_period,
      series_type: parse_series_type(Keyword.get(opts, :series_type)),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(func, params)
  end
end
