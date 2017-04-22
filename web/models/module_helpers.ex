defmodule ShipDesigner.ModuleHelpers do
  @moduledoc """
  Conveniences for dealing with Modules.
  """

  def is_bulkhead?(module), do: module.category == "Bulkhead"
  def is_life_support?(module), do: module.name == "Life Support"
  def is_weapon?(module), do: module.category == "Weapon Hardpoint"
end
