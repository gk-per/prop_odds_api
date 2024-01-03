defmodule PropOddsAPI.Model.Outcome do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :timestamp,
    :handicap,
    :odds,
    :participant,
    :participant_name,
    :name,
    :description
  ]

  @type t :: %__MODULE__{
    :timestamp => String.t,
    :handicap => float(),
    :odds => integer(),
    :participant => integer() | nil,
    :participant_name => String.t | nil,
    :name => String.t,
    :description => String.t
  }

  def decode(value) do
    value
  end
end
