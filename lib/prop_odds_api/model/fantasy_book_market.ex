defmodule PropOddsAPI.Model.FantasyBookMarket do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :market_key,
    :lines
  ]

  @type t :: %__MODULE__{
    :market_key => String.t,
    :lines => [PropOddsAPI.Model.Line.t]
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:lines, :list, PropOddsAPI.Model.Line)
  end
end
