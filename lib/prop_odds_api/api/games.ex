defmodule PropOddsAPI.Api.Games do
  @moduledoc """
  This module provides functionality to interact with game data from the PropOdds API.
  """
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

  @doc """
  Retrieves information for a specific game by its ID.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `game_id`: The unique identifier for the game, as a `String.t()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list (currently unused).

  ## Returns

  - `{:ok, PropOddsAPI.Model.GameInfo.t()}`: On success, returns the game information.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_game(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.GameInfo.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_game(connection, game_id, api_key, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/beta/game/#{game_id}")
      |> add_param(:query, :api_key, api_key)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.GameInfo},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end

  @doc """
  Fetches games information for a specific league and date.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `league`: The league identifier, as a `String.t()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `date`: The date for which games information is requested, as a `Date.t()`.
  - `opts`: Optional parameters provided as a keyword list, which may include timezone (`:tz`).

  ## Returns

  - `{:ok, PropOddsAPI.Model.GamesInfo.t()}`: On success, returns the games information.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_games(Tesla.Env.client(), String.t(), String.t(), Date.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:ok, PropOddsAPI.Model.GamesInfo.t()}
          | {:error, Tesla.Env.t()}
  def get_games(connection, league, api_key, date, opts \\ []) do
    optional_params = %{
      :tz => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/beta/games/#{league}")
      |> add_param(:query, :api_key, api_key)
      |> add_param(:query, :date, date)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.GamesInfo},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end
end
