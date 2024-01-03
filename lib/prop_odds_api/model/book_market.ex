defmodule PropOddsAPI.Model.BookMarket do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :market_key,
    :outcomes
  ]

  @type t :: %__MODULE__{
    :market_key => String.t,
    :outcomes => [PropOddsAPI.Model.Outcome.t]
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:outcomes, :list, PropOddsAPI.Model.Outcome)
  end
end
