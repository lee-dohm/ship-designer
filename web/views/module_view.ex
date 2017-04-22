defmodule ShipDesigner.ModuleView do
  use ShipDesigner.Web, :view

  import Number.Delimit

  def format_full_name(module), do: "#{format_size(module)} #{module.name}"

  def format_mass(module, options \\ %{})

  def format_mass(module, %{}), do: module.mass

  def format_mass(module, :with_unit) do
    case module.mass do
      nil -> "0 T"
      _ -> "#{module.mass} T"
    end
  end

  def format_power_draw(module, options \\ %{})

  def format_power_draw(module, %{}), do: module.power_draw

  def format_power_draw(module, :with_unit) do
    case module.power_draw do
      nil -> "0 MW"
      _ -> "#{module.power_draw} MW"
    end
  end

  def format_price(module, options \\ %{})

  def format_price(module, %{}), do: Number.Delimit.number_to_delimited(module.price)

  def format_price(module, :with_unit) do
    case module.price do
      nil -> "0 CR"
      _ -> "#{Number.Delimit.number_to_delimited(module.price)} CR"
    end
  end

  def format_size(module) do
    cond do
      module.category == "Bulkhead" -> nil
      true -> "#{module.class}#{module.rating}"
    end
  end
end
