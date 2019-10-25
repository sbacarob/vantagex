defmodule Vantagex.Helper do
  @moduledoc false

  @word_intervals [:daily, :weekly, :monthly]
  @time_intervals [1, 5, 15, 30, 60]
  @known_series_types [:close, :open, :high, :low]

  def clean_params(params) do
    params
    |> Enum.reject(&(is_nil(elem(&1, 1))))
    |> Map.new()
  end

  def resolve_request(function, params, prefix \\ nil) do
    function
    |> get_function_name(prefix)
    |> Vantagex.call_api(params)
  end

  def parse_interval(interval) when interval in @word_intervals, do: to_string(interval)
  def parse_interval(interval) when interval in @time_intervals, do: "#{interval}min"
  def parse_interval(interval), do: raise("Unsupported interval #{interval}. Supported intervals
    are: 1, 5, 15, 30, 60, :daily, :weekly, :monthly")

  def parse_series_type(type) when is_nil(type), do: "close"
  def parse_series_type(type) when type in @known_series_types, do: to_string(type)

  defp get_function_name(function, prefix) do
    key = function
          |> to_string()
          |> String.upcase()

    add_group_prefix(key, prefix)
  end

  defp add_group_prefix(key, prefix) when is_nil(prefix), do: key
  defp add_group_prefix(key, prefix), do: "#{prefix}_#{key}"
end
