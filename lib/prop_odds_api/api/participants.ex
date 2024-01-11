defmodule PropOddsAPI.Api.Participants do
  @moduledoc """
  This module provides functionality to interact with markets data from the PropOdds API.
  """
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

  @doc """
  Retrieves information for a specific participant by their ID.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `participant_id`: The unique identifier for the participant, as an `integer()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list (currently unused).

  ## Returns

  - `{:ok, PropOddsAPI.Model.Participant.t()}`: On success, returns the participant information.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_player(Tesla.Env.client(), integer(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.Participant.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_player(connection, participant_id, api_key, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/beta/participant/#{participant_id}")
      |> add_param(:query, :api_key, api_key)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.Participant},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end

  @doc """
  Looks up a participant by their name.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `name`: The name of the participant to look up, as a `String.t()`.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list (currently unused).

  ## Returns

  - `{:ok, PropOddsAPI.Model.Participant.t()}`: On success, returns the participant information.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec lookup_player(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.Participant.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def lookup_player(connection, name, api_key, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/beta/participant/lookup")
      |> add_param(:query, :name, name)
      |> add_param(:query, :api_key, api_key)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.Participant},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end
end
