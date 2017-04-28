defmodule ShipDesigner.ShipController do
  use ShipDesigner.Web, :controller

  alias ShipDesigner.Ship

  def index(conn, _params) do
    ships = Repo.all(Ship)
    render(conn, "index.html", ships: ships)
  end

  def show(conn, %{"id" => id}) do
    ship = Repo.get!(Ship, id)
    render(conn, "show.html", ship: ship)
  end
end
