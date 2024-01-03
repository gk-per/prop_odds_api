defmodule PropOddsAPI.Model.Line do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :timestamp,
    :game_id,
    :line,
    :participant,
    :participant_name
  ]

  @type t :: %__MODULE__{
    :timestamp => String.t,
    :game_id => String.t,
    :line => float(),
    :participant => integer(),
    :participant_name => String.t
  }

  def decode(value) do
    value
  end
end
