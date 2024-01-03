defmodule PropOddsAPI.Model.Usage do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :plan,
    :used,
    :limit
  ]

  @type t :: %__MODULE__{
    :plan => String.t,
    :used => integer(),
    :limit => integer()
  }

  def decode(value) do
    value
  end
end
