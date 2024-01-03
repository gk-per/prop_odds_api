defmodule PropOddsAPI.Model.Market do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :name
  ]

  @type t :: %__MODULE__{
    :name => String.t
  }

  def decode(value) do
    value
  end
end
