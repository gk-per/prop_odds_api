defmodule PropOddsAPI.Model.FantasyBookMultiMarket do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :bookie_key,
    :markets
  ]

  @type t :: %__MODULE__{
    :bookie_key => String.t,
    :markets => [PropOddsAPI.Model.FantasyBookMarket.t]
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:markets, :list, PropOddsAPI.Model.FantasyBookMarket)
  end
end
