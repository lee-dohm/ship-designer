defmodule ShipDesigner.FormatHelpers do
  @moduledoc """
  Conveniences for formatting common values.
  """

  @doc """
  Formats an amount of distance for display.

  ## Options

  * `:with_unit` - Displays the distance with the given unit designation (defaults to `km`)
  """
  def format_distance(distance, options \\ %{})

  def format_distance(distance, %{}), do: "#{distance}"
  def format_distance(distance, :with_unit), do: format_amount(distance, "km")
  def format_distance(distance, with_unit: unit), do: format_amount(distance, unit)

  @doc """
  Formats an amount of mass for display.

  ## Options

  * `:with_unit` - Displays the mass with the given unit designation (defaults to `T`)
  """
  def format_mass(mass, options \\ %{})

  def format_mass(mass, %{}), do: "#{mass}"
  def format_mass(mass, :with_unit), do: format_amount(mass, "T")
  def format_mass(mass, with_unit: unit), do: format_amount(mass, unit)

  @doc """
  Formats an amount of money for display.

  ## Options

  * `:with_unit` - Displays the amount of money with the unit designation
  """
  def format_money(money, options \\ %{})

  def format_money(money, %{}), do: "#{Number.Delimit.number_to_delimited(money)}"
  def format_money(money, :with_unit), do: format_amount(money, &Number.Delimit.number_to_delimited/1, "CR")

  @doc """
  Formats an amount of power for display.

  ## Options

  * `:with_unit` - Displays the amount of power with the unit designation
  """
  def format_power(power, options \\ %{})

  def format_power(power, %{}), do: "#{power}"
  def format_power(power, :with_unit), do: format_amount(power, "MW")

  @doc """
  Formats a speed for display.

  ## Options

  * `:with_unit` - Displays the speed with the unit designation (defaults to `m/s`)
  """
  def format_speed(speed, options \\ %{})

  def format_speed(speed, %{}), do: "#{speed}"
  def format_speed(speed, :with_unit), do: format_amount(speed, "m/s")

  defp format_amount(amount, unit) do
    case amount do
      nil -> "0 #{unit}"
      _ -> "#{amount} #{unit}"
    end
  end

  defp format_amount(amount, formatter, unit) do
    case amount do
      nil -> "0 #{unit}"
      _ -> "#{formatter.(amount)} #{unit}"
    end
  end
end
