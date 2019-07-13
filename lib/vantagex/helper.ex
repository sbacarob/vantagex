defmodule Vantagex.Helper do
  @moduledoc false

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

  defp get_function_name(function, prefix) do
    key = function
          |> to_string()
          |> String.upcase()

    add_group_prefix(key, prefix)
  end

  defp add_group_prefix(key, prefix) when is_nil(prefix), do: key
  defp add_group_prefix(key, prefix), do: "#{prefix}_#{key}"
end