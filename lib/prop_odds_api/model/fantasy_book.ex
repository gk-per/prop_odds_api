defmodule PropOddsAPI.Model.FantasyBook do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :bookie_key,
    :market
  ]

  @type t :: %__MODULE__{
    :bookie_key => String.t,
    :market => PropOddsAPI.Model.FantasyBookMarket.t
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:market, :struct, PropOddsAPI.Model.FantasyBookMarket)
  end
end
