defmodule ShipDesigner.ModuleView do
  use ShipDesigner.Web, :view
  use Timex

  import Number.Delimit

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

  @doc false
  def format_power_draw(module, options \\ %{})

  def format_power_draw(module, options), do: format_power(module.power_draw, options)

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
