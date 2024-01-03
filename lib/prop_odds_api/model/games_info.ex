defmodule PropOddsAPI.Model.GamesInfo do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :league,
    :date,
    :games
  ]

  @type t :: %__MODULE__{
    :league => String.t,
    :date => String.t,
    :games => [PropOddsAPI.Model.Game.t]
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:games, :list, PropOddsAPI.Model.Game)
  end
end
