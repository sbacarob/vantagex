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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def sma(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:sma, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ema(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:ema, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def wma(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:wma, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def dema(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:dema, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def tema(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:tema, symbol, interval, time_period, series_type, opts)
  end

  @doc """
  Alias for TEMA. Check `tema/4` for documentation.
  """
  def t3(symbol, interval, time_period, series_type, opts \\ []), do: tema(symbol, interval, time_period, series_type, opts)

  @doc """
  Uses Alpha Vantage's MACD function.
  Returns the moving average convergence / divergence (MACD) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastperiod` - positive integers are accepted. Defaults to 12
  * `slowperiod` - positive integers are accepted. Defaults to 26
  * `signalperiod` - positive integers are accepted. Defaults to 9
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def macd(symbol, interval, series_type, opts \\ []) do
    type_3_function(:macd, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's MACDEXT function.
  Returns the moving average convergence / divergence (MACDEXT) values with controllable moving average type.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastperiod` - positive integers are accepted. Defaults to 12
  * `slowperiod` - positive integers are accepted. Defaults to 26
  * `signalperiod` - positive integers are accepted. Defaults to 9
  * `fastmatype` - moving average type for the faster moving average. Defaults to 0. Integers 0-8 accepted.
  MA_TYPES_MAPPING
  * `slowmatype` - moving average type for the slower moving average. Defaults to 0. Integers 0-8 accepted.
  MA_TYPES_MAPPING
  * `signalmatype` - moving average type for the signal moving average. Defaults to 0. Integers 0-8 accepted.
  MA_TYPES_MAPPING
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def macdext(symbol, interval, series_type, opts \\ []) do
    type_3_function(:macdext, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's STOCH function.
  Returns the stochastic oscillator (STOCH) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastkperiod` - The time period of the fastk moving average. Positive integers are accepted. Defaults to 5
  * `slowkperiod` - The time period of the slowk moving average. Positive integers are accepted. Defaults to 3
  * `slowdperiod` - The time period of the slowd moving average. Positive integers are accepted. Defaults to 3
  * `slowkmatype` - Moving average type for the slowk moving average. Defaults to 0. Integers 0-8 accepted.
  MA_TYPES_MAPPING
  * `slowdmatype` - Moving average type for the slowd moving average. Defaults to 0. Integers 0-8 accepted.
  MA_TYPES_MAPPING
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def stoch(symbol, interval, opts \\ []) do
    type_4_function(:stoch, symbol, interval, opts)
  end

  @doc """
  Uses Alpha Vantage's STOCHF function.
  Returns the stochastic fast (STOCHF) values with controllable moving average type.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastkperiod` - The time period of the fastk moving average. Positive integers are accepted. Defaults to 5
  * `fastdperiod` - The time period of the fastd moving average. Positive integers are accepted. Defaults to 3
  * `fastdmatype` - Moving average type for the fastd moving average. Defaults to 0. Integers 0-8 accepted.
  MA_TYPES_MAPPING
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def stochf(symbol, interval, opts \\ []) do
    type_4_function(:stochf, symbol, interval, opts)
  end

  @doc """
  Uses Alpha Vantage's TRIMA function.
  Returns the triangular moving average (TRIMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def trima(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:trima, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def kama(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:kama, symbol, interval, time_period, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's MAMA function.
  Returns the MESA adaptive moving average (MAMA) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastlimit` - positive floats are accepted. Defaults to 0.01
  * `slowlimit` - positive floats are accepted. Defaults to 0.01
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def mama(symbol, interval, series_type, opts \\ []) do
    type_3_function(:mama, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's VWAP function.
  Returns the volume weighted average price (VWAP) for intraday time series.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"). Supported values: 1, 5, 15, 30, 60.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def vwap(symbol, interval, opts \\ []) do
    type_4_function(:vwap, symbol, interval, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def rsi(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:rsi, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastkperiod` - The time period of the fastk moving average. Positive integers are accepted.
  * `fastdperiod` - The time period of the fastd moving average. Positive integers are accepted.
  * `fastdmatype` - Moving average type for the fastd moving average. Integers 0-8 are accepted.
  0 = SMA. 1 = EMA. 2 = WMA. 3 = DEMA. 4 = TEMA. 5 = TRIMA. 6 = T3. 7 = KAMA. 8 = MAMA
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def stochrsi(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:stochrsi, symbol, interval, time_period, series_type, opts)
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
    type_2_function(:willr, symbol, interval, time_period, opts)
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
    type_2_function(:adx, symbol, interval, time_period, opts)
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
    type_2_function(:adxr, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's APO function.
  Returns the absolute price oscillator (APO) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastperiod` - positive integers are accepted. Defaults to 12
  * `slowperiod` - positive integers are accepted. Defaults to 26
  * `matype` - Moving average type. Defaults to 0. Integers 0-8 are accepted.
  MA_TYPES_MAPPING
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def apo(symbol, interval, series_type, opts \\ []) do
    type_3_function(:apo, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's PPO function.
  Returns the percentage price oscillator (PPO) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastperiod` - positive integers are accepted. Defaults to 12
  * `slowperiod` - positive integers are accepted. Defaults to 26
  * `matype` - Moving average type. Defaults to 0. Integers 0-8 are accepted.
  MA_TYPES_MAPPING
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ppo(symbol, interval, series_type, opts \\ []) do
    type_3_function(:ppo, symbol, interval, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def mom(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:mom, symbol, interval, time_period, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's BOP function.
  Returns the balance of power (BOP) values with controllable moving average type.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def bop(symbol, interval, opts \\ []) do
    type_4_function(:bop, symbol, interval, opts)
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

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def cci(symbol, interval, time_period, opts \\ []) do
    type_2_function(:cci, symbol, interval, time_period, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def cmo(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:cmo, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def roc(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:roc, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def rocr(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:rocr, symbol, interval, time_period, series_type, opts)
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

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def aroon(symbol, interval, time_period, opts \\ []) do
    type_2_function(:aroon, symbol, interval, time_period, opts)
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

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def aroonosc(symbol, interval, time_period, opts \\ []) do
    type_2_function(:aroonosc, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's MFI function.
  Returns the money flow index (MFI) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each MFI value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def mfi(symbol, interval, time_period, opts \\ []) do
    type_2_function(:mfi, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's TRIX function.
  Returns the 1-day rate of change of a triple smooth exponential moving average (TRIX) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer.
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def trix(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:trix, symbol, interval, time_period, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's ULTOSC function.
  Returns the ultimate oscillator (ULTOSC) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `timeperiod1` - The first time period of the indicator. Positive integers are accepted. Defaults to 7
  * `timeperiod2` - The second time period of the indicator. Positive integers are accepted. Defaults to 14
  * `timeperiod3` - The third time period of indicator. Positive integers are accepted. Defaults to 28
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ultosc(symbol, interval, opts \\ []) do
    type_4_function(:ultosc, symbol, interval, opts)
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
    type_2_function(:dx, symbol, interval, time_period, opts)
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
    type_2_function(:minus_di, symbol, interval, time_period, opts)
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
    type_2_function(:plus_di, symbol, interval, time_period, opts)
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
    type_2_function(:minus_dm, symbol, interval, time_period, opts)
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
    type_2_function(:plus_dm, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's BBANDS function.
  Returns the Bollinger bands (BBANDS) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each moving average value. Should be a positive integer.
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function.

  Allowed options:
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `nbdevup` - The standard deviation multiplier of the upper band. Positive integers are accepted. Defaults to 2.
  * `nbdevdn` - The standard deviation multiplier of the lower band. Positive integers are accepted. Defaults to 2.
  * `matype` - Moving average type of the time series. Defaults to 0. Integers 0-8 are accepted.
  0 = SMA. 1 = EMA. 2 = WMA. 3 = DEMA. 4 = TEMA. 5 = TRIMA. 6 = T3. 7 = KAMA. 8 = MAMA
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def bbands(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:bbands, symbol, interval, time_period, series_type, opts)
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
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def midpoint(symbol, interval, time_period, series_type, opts \\ []) do
    type_1_function(:midpoint, symbol, interval, time_period, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's MIDPRICE function.
  Returns the midpoint price (MIDPRICE) values. `MIDPRICE = (highest high + lowest low) / 2`

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `time_period` - Number of data points to calculate each midprice value. Should be a positive integer
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def midprice(symbol, interval, time_period, opts \\ []) do
    type_2_function(:midprice, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's SAR function.
  Returns the parabolic SAR (SAR) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `acceleration` - The acceleration factor. Positive floats are accepted. Defaults to 0.01
  * `maximum` - The acceleration factor maximum value. Positive floats are accepted. Defaults to 0.20
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def sar(symbol, interval, opts \\ []) do
    type_4_function(:sar, symbol, interval, opts)
  end

  @doc """
  Uses Alpha Vantage's TRANGE function.
  Returns the true range (TRANGE) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def trange(symbol, interval, opts \\ []) do
    type_4_function(:trange, symbol, interval, opts)
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
    type_2_function(:atr, symbol, interval, time_period, opts)
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
    type_2_function(:natr, symbol, interval, time_period, opts)
  end

  @doc """
  Uses Alpha Vantage's AD function.
  Returns the Chaikin A/D line (AD) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ad(symbol, interval, opts \\ []) do
    type_4_function(:ad, symbol, interval, opts)
  end

  @doc """
  Uses Alpha Vantage's ADOSC function.
  Returns the Chaikin A/D oscillator (ADOSC) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `fastperiod` - The time period of the fast EMA. Positive integers are accepted. Defaults to 3.
  * `slowperiod` - The time period of the slow EMA. Positive integers are accepted. Defaults to 10.
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def adosc(symbol, interval, opts \\ []) do
    type_4_function(:adosc, symbol, interval, opts)
  end

  @doc """
  Uses Alpha Vantage's OBV function.
  Returns the on balance volume (OBV) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def obv(symbol, interval, opts \\ []) do
    type_4_function(:obv, symbol, interval, opts)
  end

  @doc """
  Uses Alpha Vantage's HT_TRENDLINE function.
  Returns the Hilbert transform, instantaneous trendline (HT_TRENDLINE) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ht_trendline(symbol, interval, series_type, opts \\ []) do
    type_3_function(:ht_trendline, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's HT_SINE function.
  Returns the Hilbert transform, sine wave (HT_SINE) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ht_sine(symbol, interval, series_type, opts \\ []) do
    type_3_function(:ht_sine, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's HT_TRENDMODE function.
  Returns the Hilbert transform, trend vs cycle mode (HT_TRENDMODE) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ht_trendmode(symbol, interval, series_type, opts \\ []) do
    type_3_function(:ht_trendmode, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's HT_DCPERIOD function.
  Returns the Hilbert transform, dominant cycle period (HT_DCPERIOD) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ht_dcperiod(symbol, interval, series_type, opts \\ []) do
    type_3_function(:ht_dcperiod, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's HT_DCPHASE function.
  Returns the Hilbert transform, dominant cycle phase (HT_DCPHASE) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ht_dcphase(symbol, interval, series_type, opts \\ []) do
    type_3_function(:ht_dcphase, symbol, interval, series_type, opts)
  end

  @doc """
  Uses Alpha Vantage's HT_PHASOR function.
  Returns the Hilbert transform, phasor components (HT_PHASOR) values.

  Args:

  * `symbol` - The name of the security of your choice. E.g. `MSFT`
  * `interval` - Interval between two consecutive data points in the time series.
  You can pass in a number to specify minutes (e.g. 1 == "1min"), or specify the period with the
  strings known by Alpha Vantage `(:daily | :weekly | :monthly)`
  * `series_type` - The desired price type in the time series. Four types are supported: `:close`, `:open`, `:high`, `:low`.
  * `opts` - A list of extra options to pass to the function

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map
  """
  def ht_phasor(symbol, interval, series_type, opts \\ []) do
    type_3_function(:ht_phasor, symbol, interval, series_type, opts)
  end

  defp type_1_function(func, symbol, interval, time_period, series_type, opts) do
    params =
      %{
        symbol: symbol,
        interval: parse_interval(interval),
        time_period: time_period,
        series_type: series_type
      }
      |> Map.merge(Map.new(opts))
      |> clean_params()

    resolve_request(func, params)
  end

  defp type_2_function(func, symbol, interval, time_period, opts) do
    params = %{
      symbol: symbol,
      interval: parse_interval(interval),
      time_period: time_period
    }
    |> Map.merge(Map.new(opts))
    |> clean_params()

    resolve_request(func, params)
  end

  defp type_3_function(func, symbol, interval, series_type, opts) do
    params = %{
      symbol: symbol,
      interval: parse_interval(interval),
      series_type: series_type
    }
    |> Map.merge(Map.new(opts))
    |> clean_params()

    resolve_request(func, params)
  end

  def type_4_function(func, symbol, interval, opts) do
    params = %{
      symbol: symbol,
      interval: parse_interval(interval)
    }
    |> Map.merge(Map.new(opts))
    |> clean_params()

    resolve_request(func, params)
  end
end
