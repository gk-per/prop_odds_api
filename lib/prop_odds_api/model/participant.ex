defmodule PropOddsAPI.Model.Participant do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :participant_id,
    :name
  ]

  @type t :: %__MODULE__{
    :participant_id => integer(),
    :name => String.t
  }

  def decode(value) do
    value
  end
end
