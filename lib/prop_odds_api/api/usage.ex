defmodule PropOddsAPI.Api.Usage do
  @moduledoc """
  This module provides functionality to interact with usage data from the PropOdds API.
  """
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

  @doc """
  Retrieves the API usage statistics for the provided API key.

  ## Parameters

  - `connection`: The `Tesla.Env.client()` used to make the HTTP request.
  - `api_key`: The API key used for authorization, as a `String.t()`.
  - `opts`: Optional parameters provided as a keyword list (currently unused).

  ## Returns

  - `{:ok, PropOddsAPI.Model.Usage.t()}`: On success, returns the API usage statistics.
  - `{:ok, PropOddsAPI.Model.HttpValidationError.t()}`: If there's a validation error with the HTTP request.
  - `{:error, Tesla.Env.t()}`: On failure, returns the error within the Tesla environment.
  """
  @spec get_usage(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.Usage.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_usage(connection, api_key, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/beta/usage")
      |> add_param(:query, :api_key, api_key)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.Usage},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end
end
