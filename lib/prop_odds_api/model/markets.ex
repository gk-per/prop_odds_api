defmodule PropOddsAPI.Model.Markets do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :game_id,
    :markets
  ]

  @type t :: %__MODULE__{
    :game_id => String.t,
    :markets => [PropOddsAPI.Model.Market.t]
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:markets, :list, PropOddsAPI.Model.Market)
  end
end
