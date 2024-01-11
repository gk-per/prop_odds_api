defmodule PropOddsAPI.Api.FantasyLines do
  @moduledoc """
  This module provides functionality to interact with fantasy lines data from the PropOdds API.
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
  - `opts`: Optional parameters provided as a keyword list.

  ## Returns

  - `{:ok, PropOddsAPI.Model.FantasyBooks.t()}`: On success, returns the fantasy books data.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.

  ## Examples

      iex> PropOddsAPI.Api.FantasyLines.get_fantasy_lines(connection, "game123", "marketABC", "api_key_xyz", active_only: true)
      {:ok, %PropOddsAPI.Model.FantasyBooks{}}
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
      |> url("/beta/fantasy_lines/#{game_id}/#{market}")
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
end
