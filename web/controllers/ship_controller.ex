defmodule ShipDesigner.ShipController do
  use ShipDesigner.Web, :controller

  alias ShipDesigner.Ship

  def index(conn, _params) do
    ships = Repo.all(Ship)
    render(conn, "index.html", ships: ships)
  end

  def new(conn, _params) do
    changeset = Ship.changeset(%Ship{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ship" => ship_params}) do
    changeset = Ship.changeset(%Ship{}, ship_params)

    case Repo.insert(changeset) do
      {:ok, _ship} ->
        conn
        |> put_flash(:info, "Ship created successfully.")
        |> redirect(to: ship_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ship = Repo.get!(Ship, id)
    render(conn, "show.html", ship: ship)
  end

  def edit(conn, %{"id" => id}) do
    ship = Repo.get!(Ship, id)
    changeset = Ship.changeset(ship)
    render(conn, "edit.html", ship: ship, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ship" => ship_params}) do
    ship = Repo.get!(Ship, id)
    changeset = Ship.changeset(ship, ship_params)

    case Repo.update(changeset) do
      {:ok, ship} ->
        conn
        |> put_flash(:info, "Ship updated successfully.")
        |> redirect(to: ship_path(conn, :show, ship))
      {:error, changeset} ->
        render(conn, "edit.html", ship: ship, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ship = Repo.get!(Ship, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(ship)

    conn
    |> put_flash(:info, "Ship deleted successfully.")
    |> redirect(to: ship_path(conn, :index))
  end
end
