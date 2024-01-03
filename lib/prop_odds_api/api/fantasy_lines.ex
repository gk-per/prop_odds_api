defmodule PropOddsAPI.Api.FantasyLines do
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

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
