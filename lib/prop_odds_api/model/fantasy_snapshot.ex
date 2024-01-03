defmodule PropOddsAPI.Model.FantasySnapshot do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :league,
    :fantasy_books
  ]

  @type t :: %__MODULE__{
    :league => String.t,
    :fantasy_books => [PropOddsAPI.Model.FantasyBook.t]
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:fantasy_books, :list, PropOddsAPI.Model.FantasyBook)
  end
end
