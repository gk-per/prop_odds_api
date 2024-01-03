defmodule PropOddsAPI.Model.GameInfo do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :league,
    :game
  ]

  @type t :: %__MODULE__{
    :league => String.t,
    :game => PropOddsAPI.Model.Game.t
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:game, :struct, PropOddsAPI.Model.Game)
  end
end
