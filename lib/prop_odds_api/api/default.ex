# NOTE: This file is auto generated by OpenAPI Generator 7.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule PropOddsAPI.Api.Default do
  @moduledoc """
  API calls for all endpoints tagged `Default`.
  """

  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

  @doc """
  Beta Get Fantasy Lines

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `game_id` (String.t):
  - `market` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters
    - `:active_only` (boolean()):
    - `:end_datetime` (DateTime.t):

  ### Returns

  - `{:ok, PropOddsAPI.Model.FantasyBooks.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec b_eta_get_fantasy_lines_beta_fantasy_lines_game_id_market_get(Tesla.Env.client, String.t, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.FantasyBooks.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def b_eta_get_fantasy_lines_beta_fantasy_lines_game_id_market_get(connection, game_id, market, api_key, opts \\ []) do

  end

  @doc """
  Beta Get Game

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `game_id` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, PropOddsAPI.Model.GameInfo.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec b_eta_get_game_beta_game_game_id_get(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.GameInfo.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def b_eta_get_game_beta_game_game_id_get(connection, game_id, api_key, _opts \\ []) do

  end

  @doc """
  Beta Get Games

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `league` (String.t):
  - `api_key` (String.t):
  - `date` (Date.t):
  - `opts` (keyword): Optional parameters
    - `:tz` (String.t):

  ### Returns

  - `{:ok, PropOddsAPI.Model.GamesInfo.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec b_eta_get_games_beta_games_league_get(Tesla.Env.client, String.t, String.t, Date.t, keyword()) :: {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:ok, PropOddsAPI.Model.GamesInfo.t} | {:error, Tesla.Env.t}
  def b_eta_get_games_beta_games_league_get(connection, league, api_key, date, opts \\ []) do

  end

  @doc """
  Beta Get Markets

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `game_id` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters
    - `:fantasy` (boolean()):

  ### Returns

  - `{:ok, PropOddsAPI.Model.Markets.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec b_eta_get_markets_beta_markets_game_id_get(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.Markets.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def b_eta_get_markets_beta_markets_game_id_get(connection, game_id, api_key, opts \\ []) do

  end

  @doc """
  Beta Get Odds

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `game_id` (String.t):
  - `market` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters
    - `:active_only` (boolean()):
    - `:end_datetime` (DateTime.t):

  ### Returns

  - `{:ok, PropOddsAPI.Model.SportsBooks.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec b_eta_get_odds_beta_odds_game_id_market_get(Tesla.Env.client, String.t, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.SportsBooks.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def b_eta_get_odds_beta_odds_game_id_market_get(connection, game_id, market, api_key, opts \\ []) do

  end

  @doc """
  Beta Get Player

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `participant_id` (integer()):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, PropOddsAPI.Model.Participant.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec b_eta_get_player_beta_participant_participant_id_get(Tesla.Env.client, integer(), String.t, keyword()) :: {:ok, PropOddsAPI.Model.Participant.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def b_eta_get_player_beta_participant_participant_id_get(connection, participant_id, api_key, _opts \\ []) do

  end

  @doc """
  Beta Get Usage

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, PropOddsAPI.Model.Usage.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec b_eta_get_usage_beta_usage_get(Tesla.Env.client, String.t, keyword()) :: {:ok, PropOddsAPI.Model.Usage.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def b_eta_get_usage_beta_usage_get(connection, api_key, _opts \\ []) do

  end

  @doc """
  Beta Lookup Player

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `name` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, PropOddsAPI.Model.Participant.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec b_eta_lookup_player_beta_participant_lookup_get(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.Participant.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def b_eta_lookup_player_beta_participant_lookup_get(connection, name, api_key, _opts \\ []) do

  end

  @doc """
  V1 Get Fantasy Lines

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `game_id` (String.t):
  - `market` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters
    - `:active_only` (boolean()):
    - `:end_datetime` (DateTime.t):

  ### Returns

  - `{:ok, PropOddsAPI.Model.FantasyBooks.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec v1_get_fantasy_lines_v1_fantasy_lines_game_id_market_get(Tesla.Env.client, String.t, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.FantasyBooks.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def v1_get_fantasy_lines_v1_fantasy_lines_game_id_market_get(connection, game_id, market, api_key, opts \\ []) do

  end

  @doc """
  V1 Get Fantasy Snapshot
  Get all active fantasy lines for the given league and market.

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `league` (String.t):
  - `market` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters
    - `:active_only` (boolean()):

  ### Returns

  - `{:ok, PropOddsAPI.Model.FantasySnapshot.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec v1_get_fantasy_snapshot_v1_fantasy_snapshot_league_market_get(Tesla.Env.client, String.t, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.FantasySnapshot.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def v1_get_fantasy_snapshot_v1_fantasy_snapshot_league_market_get(connection, league, market, api_key, opts \\ []) do
    optional_params = %{
      :active_only => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1/fantasy_snapshot/#{league}/#{market}")
      |> add_param(:query, :api_key, api_key)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.FantasySnapshot},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end

  @doc """
  V1 Get League Fantasy Snapshot
  Get all active fantasy lines for the given league.

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `league` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters
    - `:active_only` (boolean()):

  ### Returns

  - `{:ok, PropOddsAPI.Model.FantasyLeagueSnapshot.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec v1_get_league_fantasy_snapshot_v1_fantasy_snapshot_league_get(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:ok, PropOddsAPI.Model.FantasyLeagueSnapshot.t} | {:error, Tesla.Env.t}
  def v1_get_league_fantasy_snapshot_v1_fantasy_snapshot_league_get(connection, league, api_key, opts \\ []) do
    optional_params = %{
      :active_only => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1/fantasy_snapshot/#{league}")
      |> add_param(:query, :api_key, api_key)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.FantasyLeagueSnapshot},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end

  @doc """
  V1 Get Odds

  ### Parameters

  - `connection` (PropOddsAPI.Connection): Connection to server
  - `game_id` (String.t):
  - `market` (String.t):
  - `api_key` (String.t):
  - `opts` (keyword): Optional parameters
    - `:active_only` (boolean()):
    - `:end_datetime` (DateTime.t):

  ### Returns

  - `{:ok, PropOddsAPI.Model.SportsBooks.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec v1_get_odds_v1_odds_game_id_market_get(Tesla.Env.client, String.t, String.t, String.t, keyword()) :: {:ok, PropOddsAPI.Model.SportsBooks.t} | {:ok, PropOddsAPI.Model.HttpValidationError.t} | {:error, Tesla.Env.t}
  def v1_get_odds_v1_odds_game_id_market_get(connection, game_id, market, api_key, opts \\ []) do
    optional_params = %{
      :active_only => :query,
      :end_datetime => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1/odds/#{game_id}/#{market}")
      |> add_param(:query, :api_key, api_key)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.SportsBooks},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end
end