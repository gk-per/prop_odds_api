defmodule PropOddsAPI.Api.Odds do
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

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
