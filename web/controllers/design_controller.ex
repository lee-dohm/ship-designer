defmodule ShipDesigner.DesignController do
  use ShipDesigner.Web, :controller

  alias ShipDesigner.Design

  def index(conn, _params) do
    designs = Repo.all(Design)
    render(conn, "index.html", designs: designs)
  end

  def new(conn, _params) do
    changeset = Design.changeset(%Design{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"design" => design_params}) do
    changeset = Design.changeset(%Design{}, design_params)

    case Repo.insert(changeset) do
      {:ok, _design} ->
        conn
        |> put_flash(:info, "Design created successfully.")
        |> redirect(to: design_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    design = Repo.get!(Design, id)
    render(conn, "show.html", design: design)
  end

  def edit(conn, %{"id" => id}) do
    design = Repo.get!(Design, id)
    changeset = Design.changeset(design)
    render(conn, "edit.html", design: design, changeset: changeset)
  end

  def update(conn, %{"id" => id, "design" => design_params}) do
    design = Repo.get!(Design, id)
    changeset = Design.changeset(design, design_params)

    case Repo.update(changeset) do
      {:ok, design} ->
        conn
        |> put_flash(:info, "Design updated successfully.")
        |> redirect(to: design_path(conn, :show, design))
      {:error, changeset} ->
        render(conn, "edit.html", design: design, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    design = Repo.get!(Design, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(design)

    conn
    |> put_flash(:info, "Design deleted successfully.")
    |> redirect(to: design_path(conn, :index))
  end
end
