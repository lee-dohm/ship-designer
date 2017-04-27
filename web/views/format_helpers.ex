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
  def format_distance(distance, :with_unit), do: format_distance(distance, %{with_unit: "km"})

  def format_distance(distance, with_unit: unit) do
    case distance do
      nil -> "0 #{unit}"
      _ -> "#{distance} #{unit}"
    end
  end


  @doc """
  Formats an amount of mass for display.

  ## Options

  * `:with_unit` - Displays the mass with the given unit designation (defaults to `T`)
  """
  def format_mass(mass, options \\ %{})

  def format_mass(mass, %{}), do: "#{mass}"
  def format_mass(mass, :with_unit), do: format_mass(mass, with_unit: "T")

  def format_mass(mass, with_unit: unit) do
    case mass do
      nil -> "0 #{unit}"
      _ -> "#{mass} #{unit}"
    end
  end

  @doc """
  Formats an amount of money for display.

  ## Options

  * `:with_unit` - Displays the amount of money with the unit designation
  """
  def format_money(money, options \\ %{})

  def format_money(money, %{}), do: "#{Number.Delimit.number_to_delimited(money)}"

  def format_money(money, :with_unit) do
    case money do
      nil -> "0 CR"
      _ -> "#{Number.Delimit.number_to_delimited(money)} CR"
    end
  end

  @doc """
  Formats an amount of power for display.

  ## Options

  * `:with_unit` - Displays the amount of power with the unit designation
  """
  def format_power(power, options \\ %{})

  def format_power(power, %{}), do: "#{power}"

  def format_power(power, :with_unit) do
    case power do
      nil -> "0 MW"
      _ -> "#{power} MW"
    end
  end

  @doc """
  Formats a speed for display.

  ## Options

  * `:with_unit` - Displays the speed with the unit designation (defaults to `m/s`)
  """
  def format_speed(speed, options \\ %{})

  def format_speed(speed, %{}), do: "#{speed}"
  def format_speed(speed, :with_unit), do: format_speed(speed, with_unit: "m/s")

  def format_speed(speed, with_unit: unit) do
    case speed do
      nil -> "0 #{unit}"
      _ -> "#{speed} #{unit}"
    end
  end
end
