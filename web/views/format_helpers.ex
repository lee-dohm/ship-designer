defmodule ShipDesigner.FormatHelpers do
  @moduledoc """
  Conveniences for formatting common values.
  """

  import Number.Delimit

  @doc """
  Formats an amount of mass for display.

  ## Options

  * `:with_unit` - Displays the mass with the unit designation
  """
  def format_mass(mass, options \\ %{})

  def format_mass(mass, %{}), do: mass

  def format_mass(mass, :with_unit) do
    case mass do
      nil -> "0 T"
      _ -> "#{mass} T"
    end
  end

  @doc """
  Formats an amount of money for display.

  ## Options

  * `:with_unit` - Displays the amount of money with the unit designation
  """
  def format_money(money, options \\ %{})

  def format_money(money, %{}), do: Number.Delimit.number_to_delimited(money)

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

  def format_power(power, %{}), do: power

  def format_power(power, :with_unit) do
    case power do
      nil -> "0 MW"
      _ -> "#{power} MW"
    end
  end
end
