defmodule PropOddsAPI.Api.V1 do
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
      |> url("/v1/fantasy_lines/#{game_id}/#{market}")
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

  @spec get_fantasy_snapshot(Tesla.Env.client(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.FantasySnapshot.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_fantasy_snapshot(connection, league, market, api_key, opts \\ []) do
    optional_params = %{
      :active_only => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1/fantasy_snapshot/#{league}/#{market}")
      |> add_param(:query, :api_key, api_key)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.FantasySnapshot},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end

  @spec get_league_fantasy_snapshot(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, PropOddsAPI.Model.FantasyLeagueSnapshot.t()}
          | {:ok, PropOddsAPI.Model.HttpValidationError.t()}
          | {:error, Tesla.Env.t()}
  def get_league_fantasy_snapshot(connection, league, api_key, opts \\ []) do
    optional_params = %{
      :active_only => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1/fantasy_snapshot/#{league}")
      |> add_param(:query, :api_key, api_key)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PropOddsAPI.Model.FantasyLeagueSnapshot},
      {422, PropOddsAPI.Model.HttpValidationError}
    ])
  end

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
      |> url("/v1/odds/#{game_id}/#{market}")
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
