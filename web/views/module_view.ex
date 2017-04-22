defmodule ShipDesigner.ModuleView do
  use ShipDesigner.Web, :view

  import Number.Delimit

  @doc """
  Formats the full name of the module for viewing.

  If there is a valid size for the module, it returns the name prepended with the size. Otherwise,
  it returns only the module's name.
  """
  def format_full_name(module) do
    case format_size(module) do
      nil -> module.name
      _ -> "#{format_size(module)} #{module.name}"
    end
  end

  @doc """
  Formats the mass of the module for display.

  ## Options

  * `:with_unit` - Displays the mass with the unit designation
  """
  def format_mass(module, options \\ %{})

  def format_mass(module, %{}), do: module.mass

  def format_mass(module, :with_unit) do
    case module.mass do
      nil -> "0 T"
      _ -> "#{module.mass} T"
    end
  end

  @doc """
  Formats the power draw of the module for display.

  ## Options

  * `:with_unit` - Displays the power draw with the unit designation
  """
  def format_power_draw(module, options \\ %{})

  def format_power_draw(module, %{}), do: module.power_draw

  def format_power_draw(module, :with_unit) do
    case module.power_draw do
      nil -> "0 MW"
      _ -> "#{module.power_draw} MW"
    end
  end

  @doc """
  Formats the price of the module for display.

  ## Options

  * `:with_unit` - Displays the price with the unit designation
  """
  def format_price(module, options \\ %{})

  def format_price(module, %{}), do: Number.Delimit.number_to_delimited(module.price)

  def format_price(module, :with_unit) do
    case module.price do
      nil -> "0 CR"
      _ -> "#{Number.Delimit.number_to_delimited(module.price)} CR"
    end
  end

  @doc """
  Formats the size of the module for display.

  The size of a module is the class followed by the rating, example: `4E`.
  """
  def format_size(module) do
    cond do
      module.category == "Bulkhead" -> nil
      true -> "#{module.class}#{module.rating}"
    end
  end
end
