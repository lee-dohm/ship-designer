defmodule ShipDesigner.ModuleView do
  use ShipDesigner.Web, :view

  import Number.Delimit

  def format_price(module), do: Number.Delimit.number_to_delimited(module.price)

  def format_size(module) do
    cond do
      module.category == "Bulkhead" -> nil
      true -> "#{module.class}#{module.rating}"
    end
  end
end
