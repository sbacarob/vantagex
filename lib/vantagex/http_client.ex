defmodule Vantagex.HttpClient do
  @moduledoc """
  Module that deals with the requests to the API.

  Uses HTTPoison.Base
  """

  use HTTPoison.Base
  alias Vantagex.Config

  @endpoint Config.api_url

  @doc """
  From HTTPoison.Base. Processes the given params.
  Adds the required api_key to the params.

  Args:

  * `params` - The params that come from the request.
  """
  @spec process_request_params(map) :: map
  def process_request_params(%{datatype: :map} = params) do
    params
    |> Map.delete(:datatype)
    |> Map.merge(%{as_map: true, apikey: get_api_key()})
  end

  def process_request_params(%{datatype: datatype} = params) do
    %{
      params | datatype: to_string(datatype)
    } |> Map.merge(%{apikey: get_api_key()})
  end

  def process_request_params(params) do
    params
    |> Map.merge(%{datatype: :map})
    |> process_request_params()
  end

  @doc """
  Issue a request to the API, passing in the given params.

  Args:

  * `params` - The params to include in the request
  """
  @spec get_data(Map.t()) :: binary
  def get_data(params) do
    case get!(@endpoint, [], params: params) do
      %HTTPoison.Response{status_code: 200, body: body, request: %{params: p}} ->
        if p[:as_map], do: Jason.decode!(body), else: body
      %HTTPoison.Response{status_code: status, body: body} ->
        if status >= 300 and status < 400, do: body, else: {:error, status}
      %HTTPoison.Error{reason: reason} ->
        {:error, reason}
    end
  end

  defp get_api_key do
    Application.get_env(:vantagex, :api_key)
  end
end
