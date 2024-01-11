defmodule PropOddsAPI.Api.GamesTest do
  use ExUnit.Case, async: true
  alias PropOddsAPI.Api.Games
  alias PropOddsAPI.Connection

  @api_key Application.compile_env(:prop_odds_api, :api_key)

  describe "get_games/5" do
    test "fetches games information for a league and date successfully" do
      connection = Tesla.client(Connection.middleware())
      league = "nfl"
      date = ~D[2023-04-01]

      result = Games.get_games(connection, league, @api_key, date)

      assert {:ok, %PropOddsAPI.Model.GamesInfo{}} = result
    end

    test "fetches games information with timezone successfully" do
      connection = Tesla.client(Connection.middleware())
      league = "nfl"
      date = ~D[2023-12-31]
      opts = [tz: "America/New_York"]

      result = Games.get_games(connection, league, @api_key, date, opts)

      assert {:ok, %PropOddsAPI.Model.GamesInfo{}} = result
    end
  end
end
