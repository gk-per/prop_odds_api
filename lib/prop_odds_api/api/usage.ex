defmodule PropOddsAPI.Api.Usage do
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

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
