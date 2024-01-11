defmodule PropOddsAPI.Api.Markets do
  @moduledoc """
  This module provides functionality to interact with markets data from the PropOdds API.
  """
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

  @doc """
  Retrieves market information for a specific game by its ID.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `game_id`: The unique identifier for the game, as a `String.t()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list. Supports `:fantasy` as a boolean to indicate whether to include fantasy markets.

  ## Returns

  - `{:ok, PropOddsAPI.Model.Markets.t()}`: On success, returns the market information.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_markets(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.Markets.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_markets(connection, game_id, api_key, opts \\ []) do
    optional_params = %{
      :fantasy => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/beta/markets/#{game_id}")
      |> add_param(:query, :api_key, api_key)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.Markets},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end
end
