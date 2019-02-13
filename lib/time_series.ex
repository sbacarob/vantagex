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
  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map

  ## Examples:

      iex> Vantagex.TimeSeries.intraday("GOOG", 5)
      %{
        "Meta Data" => %{
          "1. Information" => "Intraday (5min) open, high, low, close prices and volume",
          "2. Symbol" => "GOOG",
          "3. Last Refreshed" => "2019-02-04 16:00:00",
          "4. Interval" => "5min",
          "5. Output Size" => "Compact",
          "6. Time Zone" => "US/Eastern"
        },
        "Time Series (5min)" => %{
          "2019-02-04 13:15:00" => %{
            "1. open" => "1122.5100",
            "2. high" => "1122.7200",
            "3. low" => "1121.9000",
            "4. close" => "1122.1500",
            "5. volume" => "13094"
          },
          "2019-02-04 11:50:00" => %{
            "1. open" => "1124.5500",
            "2. high" => "1125.1700",
            "3. low" => "1124.4600",
            "4. close" => "1125.0649",
            "5. volume" => "14945"
          },
          ...
        }
      }

  Or, if you prefer, you can get a plaintext JSON or CSV object by specifying the `:datatype` as an atom:

      iex> Vantagex.TimeSeries.intraday("GOOG", 5, datatype: :csv)
      "timestamp,open,high,low,close,volume\\r\\n2019-02-04 16:00:00,1130.7800,1132.4301,1130.5000,1132.4301,122109\\r\\n2019-02-04 15:55:00,1129.9800,1130.7900,1129.3140,1130.4685,52596\\r\\n2019-02-04 15:50:00,1129.2600,1130.2520,1128.8500,1129.8600,50110\\r\\n2019-02-04 15:45:00,1126.7550,1129.4750,1126.7550,1129.4100,33314\\r\\n2019-02-04 15:40:00,1127.7600,1127.7600,1125.3700,1126.4900,42554\\r\\n2019-02-04 15:35:00,1130.2900,1130.2900,1127.7006,1127.7006,36706\\r\\n2019-02-04 15:30:00,1131.1500,1131.5450,1130.3400,1130.6600,17684\\r\\n2019-02-04 15:25:00,1131.5900,1132.0100,1130.6899,1130.9900,20110\\r\\n2019-02-04 15:20:00,1130.7800,1131.7999,1130.7130,1131.3280,19301\\r\\n2019-02-04 15:15:00,1129.8400,1131.5500,1129.8400,1130.5072,36392\\r\\n2019-02-04 15:10:00,1129.0200,1130.1187,1128.0400,1130.1187,25009\\r\\n2019-02-04 15:05:00,1129.9000,1129.9998,1128.9301,1129.1600,15658\\r\\n2019-02-04 15:00:00,1130.0000,1130.4399,1129.7700,1130.0699,21459\\r\\n2019-02-04 14:55:00,1128.5500,1129.9000,1128.5500,1129.9000,41086\\r\\n2019-02-04 14:50:00,1128.8400,1128.9718,1127.8025,1128.3900,14609\\r\\n2019-02-04 14:45:00,1127.6191,1129.0000,1127.6191,1128.5900,12154\\r\\n..."

  You can also set the outputsize using the words supported by Alpha Vantage. `"compact" | "full"`
  """
  @spec intraday(String.t(), integer(), Keyword.t()) :: String.t() | Map.t()
  def intraday(symbol, interval, opts \\ []) do
    params = %{
      symbol: symbol,
      interval: "#{interval}min",
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

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

  ## Examples:

      iex> Vantagex.TimeSeries.daily("GOOG")
      %{
        "Meta Data" => %{
          "1. Information" => "Daily Prices (open, high, low, close) and Volumes",
          "2. Symbol" => "GOOG",
          "3. Last Refreshed" => "2019-02-08 16:00:01",
          "4. Output Size" => "Compact",
          "5. Time Zone" => "US/Eastern"
        },
        "Time Series (Daily)" => %{
          "2018-11-12" => %{
            "1. open" => "1061.3900",
            "2. high" => "1062.1200",
            "3. low" => "1031.0000",
            "4. close" => "1038.6300",
            "5. volume" => "1471758"
          },
          "2018-12-06" => %{
            "1. open" => "1034.2600",
            "2. high" => "1071.2000",
            "3. low" => "1030.7700",
            "4. close" => "1068.7300",
            "5. volume" => "2769225"
          },
          ...
        }
      }
  """
  @spec daily(String.t(), Keyword.t()) :: String.t() | Map.t()
  def daily(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

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

  ## Examples:

      iex> Vantagex.TimeSeries.daily_adjusted("GOOG")
      %{
        "Meta Data" => %{
          "1. Information" => "Daily Time Series with Splits and Dividend Events",
          "2. Symbol" => "GOOG",
          "3. Last Refreshed" => "2019-02-08 16:00:01",
          "4. Output Size" => "Compact",
          "5. Time Zone" => "US/Eastern"
        },
        "Time Series (Daily)" => %{
          "2018-11-12" => %{
            "1. open" => "1061.3900",
            "2. high" => "1062.1200",
            "3. low" => "1031.0000",
            "4. close" => "1038.6300",
            "5. adjusted close" => "1038.6300",
            "6. volume" => "1471758",
            "7. dividend amount" => "0.0000",
            "8. split coefficient" => "1.0000"
          },
          "2018-12-06" => %{
            "1. open" => "1034.2600",
            "2. high" => "1071.2000",
            "3. low" => "1030.7700",
            "4. close" => "1068.7300",
            "5. adjusted close" => "1068.7300",
            "6. volume" => "2769225",
            "7. dividend amount" => "0.0000",
            "8. split coefficient" => "1.0000"
          },
          ...
        }
      }
  """
  @spec daily_adjusted(String.t(), Keyword.t()) :: String.t() | Map.t()
  def daily_adjusted(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

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

  ## Examples:

      iex> Vantagex.TimeSeries.weekly("GOOG")
      %{
        "Meta Data" => %{
          "1. Information" => "Weekly Prices (open, high, low, close) and Volumes",
          "2. Symbol" => "GOOG",
          "3. Last Refreshed" => "2019-02-08 16:00:01",
          "4. Time Zone" => "US/Eastern"
        },
        "Weekly Time Series" => %{
          "2017-08-04" => %{
            "1. open" => "941.8900",
            "2. high" => "943.5900",
            "3. low" => "916.6800",
            "4. close" => "927.9600",
            "5. volume" => "7178897"
          },
          "2015-10-09" => %{
            "1. open" => "632.0000",
            "2. high" => "650.6090",
            "3. low" => "625.5600",
            "4. close" => "643.6100",
            "5. volume" => "9964021"
          },
          ...
        }
      }
  """
  @spec weekly(String.t(), Keyword.t()) :: String.t() | Map.t()
  def weekly(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

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

  ## Examples:

      iex> Vantagex.TimeSeries.weekly_adjusted("GOOG")
      %{
        "Meta Data" => %{
          "1. Information" => "Weekly Adjusted Prices and Volumes",
          "2. Symbol" => "GOOG",
          "3. Last Refreshed" => "2019-02-08 16:00:01",
          "4. Time Zone" => "US/Eastern"
        },
        "Weekly Adjusted Time Series" => %{
          "2017-08-04" => %{
            "1. open" => "941.8900",
            "2. high" => "943.5900",
            "3. low" => "916.6800",
            "4. close" => "927.9600",
            "5. adjusted close" => "927.9600",
            "6. volume" => "7178897",
            "7. dividend amount" => "0.0000"
          },
          "2015-10-09" => %{
            "1. open" => "632.0000",
            "2. high" => "650.6090",
            "3. low" => "625.5600",
            "4. close" => "643.6100",
            "5. adjusted close" => "643.6100",
            "6. volume" => "9964021",
            "7. dividend amount" => "0.0000"
          },
          ...
        }
      }
  """
  @spec weekly_adjusted(String.t(), Keyword.t()) :: String.t() | Map.t()
  def weekly_adjusted(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

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

  ## Examples:

      iex> Vantagex.TimeSeries.monthly("GOOG")
      %{
        "Meta Data" => %{
          "1. Information" => "Monthly Prices (open, high, low, close) and Volumes",
          "2. Symbol" => "GOOG",
          "3. Last Refreshed" => "2019-02-08 16:00:01",
          "4. Time Zone" => "US/Eastern"
        },
        "Monthly Time Series" => %{
          "2017-06-30" => %{
            "1. open" => "968.9500",
            "2. high" => "988.2500",
            "3. low" => "908.3100",
            "4. close" => "908.7300",
            "5. volume" => "42736021"
          },
          "2018-11-30" => %{
            "1. open" => "1075.8000",
            "2. high" => "1095.5700",
            "3. low" => "996.0200",
            "4. close" => "1094.4300",
            "5. volume" => "36735570"
          },
          ...
        }
      }
  """
  @spec monthly(String.t(), Keyword.t()) :: String.t() | Map.t()
  def monthly(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

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

  ## Examples

      iex> Vantagex.TimeSeries.monthly_adjusted("GOOG")
      %{
        "Meta Data" => %{
          "1. Information" => "Monthly Adjusted Prices and Volumes",
          "2. Symbol" => "GOOG",
          "3. Last Refreshed" => "2019-02-08 16:00:01",
          "4. Time Zone" => "US/Eastern"
        },
        "Monthly Adjusted Time Series" => %{
          "2017-06-30" => %{
            "1. open" => "968.9500",
            "2. high" => "988.2500",
            "3. low" => "908.3100",
            "4. close" => "908.7300",
            "5. adjusted close" => "908.7300",
            "6. volume" => "42736021",
            "7. dividend amount" => "0.0000"
          },
          "2018-11-30" => %{
            "1. open" => "1075.8000",
            "2. high" => "1095.5700",
            "3. low" => "996.0200",
            "4. close" => "1094.4300",
            "5. adjusted close" => "1094.4300",
            "6. volume" => "36735570",
            "7. dividend amount" => "0.0000"
          },
          ...
        }
      }
  """
  @spec monthly_adjusted(String.t(), Keyword.t()) :: String.t() | Map.t()
  def monthly_adjusted(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      outputsize: Keyword.get(opts, :outputsize),
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(:monthly_adjusted, params)
  end

  @doc """
  Uses Alpha Vantage's `GLOBAL_QUOTE` function.
  Returns the latest price and volume information for a given security.

  Args:

  * `symbol` - The symbol of the security to use. E.g. `MSFT`
  * `opts` - A list of extra options to pass to the function.

  Allowed options:

  * `datatype` - `:map | :json | :csv` specifies the return format. Defaults to :map

  ## Examples:

      iex> Vantagex.TimeSeries.quote("GOOG")
      %{
        "Global Quote" => %{
          "01. symbol" => "GOOG",
          "02. open" => "1106.8000",
          "03. high" => "1125.3000",
          "04. low" => "1105.9001",
          "05. price" => "1121.3700",
          "06. volume" => "347",
          "07. latest trading day" => "2019-02-12",
          "08. previous close" => "1095.0100",
          "09. change" => "26.3600",
          "10. change percent" => "2.4073%"
        }
      }

      iex> Vantagex.TimeSeries.quote("GOOG", datatype: :csv)
      "symbol,open,high,low,price,volume,latestDay,previousClose,change,changePercent\\r\\nGOOG,1106.8000,1125.3000,1105.9001,1121.3700,347,2019-02-12,1095.0100,26.3600,2.4073%\\r\\n"
  """
  @spec quote(String.t(), Keyword.t()) :: String.t() | Map.t()
  def quote(symbol, opts \\ []) do
    params = %{
      symbol: symbol,
      datatype: Keyword.get(opts, :datatype)
    } |> clean_params()

    resolve_request(:global_quote, params)
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

  defp add_group_prefix(:global_quote, key), do: key
  defp add_group_prefix(_function, key), do: "#{@module_id}_#{key}"
end
