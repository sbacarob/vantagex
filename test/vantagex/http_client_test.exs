defmodule Vantagex.HttpClientTest do
  use ExUnit.Case, async: true

  alias Vantagex.HttpClient

  test "datatype defaults to map when not included" do
    expected = %{
      as_map: true,
      apikey: "TEST_API_KEY",
    }

    assert HttpClient.process_request_params(%{}) == expected
  end

  test "apikey is correctly added" do
    expected = %{
      datatype: "json",
      apikey: "TEST_API_KEY"
    }

    assert HttpClient.process_request_params(%{datatype: :json}) == expected
  end

  test "params that come as atoms are converted to string" do
    expected = %{
      datatype: "json",
      interval: "daily",
      series_type: "close",
      apikey: "TEST_API_KEY"
    }

    req_params = %{
      datatype: :json,
      interval: :daily,
      series_type: :close,
      apikey: "TEST_API_KEY"
    }

    assert HttpClient.process_request_params(req_params) == expected
  end
end