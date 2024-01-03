defmodule PropOddsAPI.Model.ValidationError do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :loc,
    :msg,
    :type
  ]

  @type t :: %__MODULE__{
    :loc => [PropOddsAPI.Model.LocationInner.t],
    :msg => String.t,
    :type => String.t
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:loc, :list, PropOddsAPI.Model.LocationInner)
  end
end
