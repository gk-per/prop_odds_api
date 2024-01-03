defmodule PropOddsAPI.Deserializer do
  @moduledoc """
  Helper functions for deserializing responses into models
  """

  @jason_decode_opts [keys: :strings]

  def jason_decode(json) do
    Jason.decode(json, @jason_decode_opts)
  end

  def jason_decode(json, module) do
    json
    |> jason_decode()
    |> case do
      {:ok, decoded} -> {:ok, to_struct(decoded, module)}
      {:error, _} = error -> error
    end
  end

  @doc """
  Update the provided model with a deserialization of a nested value
  """
  @spec deserialize(struct(), atom(), :date | :datetime | :list | :map | :struct, module()) ::
          struct()
  def deserialize(model, field, :list, module) do
    model
    |> Map.update!(field, fn
      nil ->
        nil

      list ->
        Enum.map(list, &to_struct(&1, module))
    end)
  end

  def deserialize(model, field, :struct, module) do
    model
    |> Map.update!(field, fn
      nil ->
        nil

      value ->
        to_struct(value, module)
    end)
  end

  def deserialize(model, field, :map, module) do
    maybe_transform_map = fn
      nil ->
        nil

      existing_value ->
        Map.new(existing_value, fn
          {key, value} ->
            {key, to_struct(value, module)}
        end)
    end

    Map.update!(model, field, maybe_transform_map)
  end

  def deserialize(model, field, :date, _) do
    value = Map.get(model, field)

    case is_binary(value) do
      true ->
        case Date.from_iso8601(value) do
          {:ok, date} -> Map.put(model, field, date)
          _ -> model
        end

      false ->
        model
    end
  end

  def deserialize(model, field, :datetime, _) do
    value = Map.get(model, field)

    case is_binary(value) do
      true ->
        case DateTime.from_iso8601(value) do
          {:ok, datetime, _offset} -> Map.put(model, field, datetime)
          _ -> model
        end

      false ->
        model
    end
  end

  defp to_struct(map_or_list, module)
  defp to_struct(nil, _), do: nil

  defp to_struct(list, module) when is_list(list) and is_atom(module) do
    Enum.map(list, &to_struct(&1, module))
  end

  defp to_struct(map, module) when is_map(map) and is_atom(module) do
    model = struct(module)

    model
    |> Map.keys()
    |> List.delete(:__struct__)
    |> Enum.reduce(model, fn field, acc ->
      Map.replace(acc, field, Map.get(map, Atom.to_string(field)))
    end)
    |> module.decode()
  end
end
