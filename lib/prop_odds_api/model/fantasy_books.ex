defmodule PropOddsAPI.Model.FantasyBooks do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :game_id,
    :fantasy_books
  ]

  @type t :: %__MODULE__{
    :game_id => String.t,
    :fantasy_books => [PropOddsAPI.Model.FantasyBook.t]
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:fantasy_books, :list, PropOddsAPI.Model.FantasyBook)
  end
end
