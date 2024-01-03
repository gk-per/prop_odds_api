defmodule PropOddsAPI.Model.SportsBook do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :bookie_key,
    :market
  ]

  @type t :: %__MODULE__{
    :bookie_key => String.t,
    :market => PropOddsAPI.Model.BookMarket.t
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:market, :struct, PropOddsAPI.Model.BookMarket)
  end
end
