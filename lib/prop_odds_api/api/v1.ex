defmodule PropOddsAPI.Api.V1 do
  @moduledoc """
  This module provides functionality to interact with V1 of the PropOdds API.
  """
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

  @doc """
  Fetches fantasy lines for a given game and market.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `game_id`: The unique identifier for the game, as a `String.t()`.
  - `market`: The market type for which the fantasy lines are being requested, as a `String.t()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list. Can include `:active_only` and `:end_datetime` to filter the results.

  ## Returns

  - `{:ok, PropOddsAPI.Model.FantasyBooks.t()}`: On success, returns the fantasy books data.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_fantasy_lines(Tesla.Env.client(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.FantasyBooks.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_fantasy_lines(connection, game_id, market, api_key, opts \\ []) do
    optional_params = %{
      :active_only => :query,
      :end_datetime => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1/fantasy_lines/#{game_id}/#{market}")
      |> add_param(:query, :api_key, api_key)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.FantasyBooks},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end

  @doc """
  Retrieves a snapshot of fantasy data for a given league and market.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `league`: The identifier for the league, as a `String.t()`.
  - `market`: The market type for which the fantasy snapshot is being requested, as a `String.t()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list. Can include `:active_only` to filter the results.

  ## Returns

  - `{:ok, PropOddsAPI.Model.FantasySnapshot.t()}`: On success, returns the fantasy snapshot data.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_fantasy_snapshot(Tesla.Env.client(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.FantasySnapshot.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_fantasy_snapshot(connection, league, market, api_key, opts \\ []) do
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
  Retrieves a league-wide fantasy snapshot.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `league`: The identifier for the league, as a `String.t()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list. Can include `:active_only` to filter the results.

  ## Returns

  - `{:ok, PropOddsAPI.Model.FantasyLeagueSnapshot.t()}`: On success, returns the fantasy league snapshot data.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_league_fantasy_snapshot(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.FantasyLeagueSnapshot.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_league_fantasy_snapshot(connection, league, api_key, opts \\ []) do
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
  Fetches odds for a given game and market.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `game_id`: The unique identifier for the game, as a `String.t()`.
  - `market`: The market type for which the odds are being requested, as a `String.t()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list. Can include `:active_only` and `:end_datetime` to filter the results.

  ## Returns

  - `{:ok, PropOddsAPI.Model.SportsBooks.t()}`: On success, returns the odds from various sportsbooks.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_odds(Tesla.Env.client(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.SportsBooks.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_odds(connection, game_id, market, api_key, opts \\ []) do
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
