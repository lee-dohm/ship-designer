defmodule ShipDesigner.ModuleController do
  use ShipDesigner.Web, :controller

  alias ShipDesigner.Module

  def index(conn, _params) do
    modules = Repo.all(Module)
    render(conn, "index.html", modules: modules)
  end

  def new(conn, _params) do
    changeset = Module.changeset(%Module{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"module" => module_params}) do
    changeset = Module.changeset(%Module{}, module_params)

    case Repo.insert(changeset) do
      {:ok, _module} ->
        conn
        |> put_flash(:info, "Module created successfully.")
        |> redirect(to: module_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    module = Repo.get!(Module, id)

    render_module(conn, module)
  end

  def edit(conn, %{"id" => id}) do
    module = Repo.get!(Module, id)
    changeset = Module.changeset(module)
    render(conn, "edit.html", module: module, changeset: changeset)
  end

  def update(conn, %{"id" => id, "module" => module_params}) do
    module = Repo.get!(Module, id)
    changeset = Module.changeset(module, module_params)

    case Repo.update(changeset) do
      {:ok, module} ->
        conn
        |> put_flash(:info, "Module updated successfully.")
        |> redirect(to: module_path(conn, :show, module))
      {:error, changeset} ->
        render(conn, "edit.html", module: module, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    module = Repo.get!(Module, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(module)

    conn
    |> put_flash(:info, "Module deleted successfully.")
    |> redirect(to: module_path(conn, :index))
  end

  defp render_module(conn, module) do
    render(conn, "show_#{get_module_type(module)}_module.html", module: module)
  end
end
