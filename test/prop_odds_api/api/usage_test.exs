defmodule PropOddsAPI.Api.UsageTest do
  use ExUnit.Case, async: true
  alias PropOddsAPI.Api.Usage
  alias PropOddsAPI.Connection

  @api_key Application.compile_env(:prop_odds_api, :api_key)

  describe "get_usage/3" do
    test "retrieves API usage statistics successfully" do
      connection = Tesla.client(Connection.middleware())

      result = Usage.get_usage(connection, @api_key)

      assert {:ok, %PropOddsAPI.Model.Usage{}} = result
    end
  end
end
