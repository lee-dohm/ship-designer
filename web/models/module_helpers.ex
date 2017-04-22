defmodule ShipDesigner.ModuleHelpers do
  @moduledoc """
  Conveniences for dealing with Modules.
  """

  def is_bulkhead?(module), do: module.category == "Bulkhead"
end
