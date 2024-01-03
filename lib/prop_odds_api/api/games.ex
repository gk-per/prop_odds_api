defmodule PropOddsAPI.Api.Games do
  alias PropOddsAPI.Connection
  import PropOddsAPI.RequestBuilder

  @spec get_game(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.GameInfo.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_game(connection, game_id, api_key, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/beta/game/#{game_id}")
      |> add_param(:query, :api_key, api_key)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.GameInfo},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end

  @spec get_games(Tesla.Env.client(), String.t(), String.t(), Date.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:ok, PropOddsAPI.Model.GamesInfo.t()}
          | {:error, Tesla.Env.t()}
  def get_games(connection, league, api_key, date, opts \\ []) do
    optional_params = %{
      :tz => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/beta/games/#{league}")
      |> add_param(:query, :api_key, api_key)
      |> add_param(:query, :date, date)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.GamesInfo},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end
end
