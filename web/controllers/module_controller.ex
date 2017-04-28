defmodule ShipDesigner.ModuleController do
  use ShipDesigner.Web, :controller

  alias ShipDesigner.Module

  def index(conn, _params) do
    modules = Repo.all(Module)
    render(conn, "index.html", modules: modules)
  end

  def show(conn, %{"id" => id}) do
    module = Repo.get!(Module, id)

    render_module(conn, module)
  end

  defp render_module(conn, module) do
    render(conn, "show_#{get_module_type(module)}_module.html", module: module)
  end
end
