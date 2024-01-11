defmodule PropOddsAPI.Api.MarketsTest do
  use ExUnit.Case, async: true
  alias PropOddsAPI.Api.Markets
  alias PropOddsAPI.Connection

  @api_key Application.compile_env(:prop_odds_api, :api_key)

  describe "get_markets/4" do
    test "retrieves market information successfully" do
      connection = Tesla.client(Connection.middleware())
      game_id = "b39de9e8a472b637832a026f651f970c"

      result = Markets.get_markets(connection, game_id, @api_key)

      assert {:ok, %PropOddsAPI.Model.Markets{}} = result
    end

    test "retrieves market information with fantasy markets successfully" do
      connection = Tesla.client(Connection.middleware())
      game_id = "b39de9e8a472b637832a026f651f970c"
      opts = [fantasy: true]

      result = Markets.get_markets(connection, game_id, @api_key, opts)

      assert {:ok, %PropOddsAPI.Model.Markets{}} = result
    end
  end
end
