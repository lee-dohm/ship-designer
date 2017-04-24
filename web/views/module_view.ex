defmodule ShipDesigner.ModuleView do
  use ShipDesigner.Web, :view
  use Timex

  def bulkhead_ship(module), do: module.details["ship"]

  def life_support_duration(module) do
    module.details["duration"]
    |> Duration.from_seconds
    |> Timex.format_duration(:humanized)
  end

  def weapon_mode(module), do: module.details["weapon_mode"]

  @doc """
  Formats the full name of the module for viewing.
  """
  def format_full_name(module) do
    cond do
      is_bulkhead?(module) -> "#{module.name} for #{bulkhead_ship(module)}"
      is_weapon?(module) -> "#{format_size(module)} #{module.name} - #{weapon_mode(module)}"
      true -> "#{format_size(module)} #{module.name}"
    end
  end

  @doc """
  Formats the size of the module for display.

  The size of a module is the class followed by the rating, example: `4E`.
  """
  def format_size(module) do
    cond do
      is_bulkhead?(module) -> nil
      true -> "#{module.class}#{module.rating}"
    end
  end

  @doc """
  Renders the category template for the given module.
  """
  def render_category(module), do: render "show_category.html", module: module

  @doc """
  Renders the details template for the given module.
  """
  def render_details(module), do: render "show_details.html", module: module

  @doc """
  Renders the mass template for the given module.
  """
  def render_mass(module), do: render "show_mass.html", module: module

  @doc """
  Renders the power draw template for the given module.
  """
  def render_power_draw(module), do: render "show_power_draw.html", module: module

  @doc """
  Renders the price template for the given module.
  """
  def render_price(module), do: render "show_price.html", module: module
end
