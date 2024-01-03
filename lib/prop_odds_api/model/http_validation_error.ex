defmodule PropOddsAPI.Model.HttpValidationError do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :detail
  ]

  @type t :: %__MODULE__{
    :detail => [PropOddsAPI.Model.ValidationError.t] | nil
  }

  alias PropOddsAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:detail, :list, PropOddsAPI.Model.ValidationError)
  end
end
