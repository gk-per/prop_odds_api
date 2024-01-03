defmodule PropOddsAPI.Model.Game do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :game_id,
    :away_team,
    :home_team,
    :start_timestamp,
    :participants
  ]

  @type t :: %__MODULE__{
    :game_id => String.t,
    :away_team => String.t | nil,
    :home_team => String.t | nil,
    :start_timestamp => String.t,
    :participants => [integer()]
  }

  def decode(value) do
    value
  end
end
