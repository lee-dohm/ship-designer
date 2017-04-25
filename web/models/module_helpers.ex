defmodule ShipDesigner.ModuleHelpers do
  @moduledoc """
  Conveniences for dealing with Modules.
  """

  def get_module_type(module) do
    cond do
      is_bulkhead?(module) -> :bulkhead
      is_life_support?(module) -> :life_support
      is_power_plant?(module) -> :power_plant
      is_sensors?(module) -> :sensors
      is_weapon?(module) -> :weapon
      true -> :default
    end
  end

  def is_bulkhead?(module), do: module.category == "Bulkhead"
  def is_life_support?(module), do: module.name == "Life Support"
  def is_power_plant?(module), do: module.name == "Power Plant"
  def is_sensors?(module), do: module.name == "Sensors"
  def is_weapon?(module), do: module.category == "Weapon Hardpoint"
end
