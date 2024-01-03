defmodule PropOddsAPI.Model.SportsBooks do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :game_id,
    :sportsbooks
  ]

  @type t :: %__MODULE__{
    :game_id => String.t,
    :sportsbooks => [PropOddsAPI.Model.SportsBook.t]
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:sportsbooks, :list, PropOddsAPI.Model.SportsBook)
  end
end
