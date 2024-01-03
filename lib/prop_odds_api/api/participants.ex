defmodule PropOddsAPI.Api.Participants do
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

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
