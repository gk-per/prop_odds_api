defmodule PropOddsAPI.Api.Odds do
  @moduledoc """
  This module provides functionality to interact with odds data from the PropOdds API.
  """
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

  @doc """
  Retrieves the odds for a specific game and market.

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
      |> url("/beta/odds/#{game_id}/#{market}")
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
