defmodule PropOddsAPI.Api.Markets do
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

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
