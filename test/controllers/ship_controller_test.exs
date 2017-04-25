defmodule ShipDesigner.ShipControllerTest do
  use ShipDesigner.ConnCase

  alias ShipDesigner.Ship
  @valid_attrs %{armor: 42, boost_speed: 42, height: "120.5", hull_mass: 42, length: "120.5", maneuverability: 42, manufacturer: "some content", mass_lock: 42, name: "some content", pad_size: "some content", price: 42, shields: 42, top_speed: 42, type: "some content", width: "120.5"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, ship_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing ships"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, ship_path(conn, :new)
    assert html_response(conn, 200) =~ "New ship"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, ship_path(conn, :create), ship: @valid_attrs
    assert redirected_to(conn) == ship_path(conn, :index)
    assert Repo.get_by(Ship, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, ship_path(conn, :create), ship: @invalid_attrs
    assert html_response(conn, 200) =~ "New ship"
  end

  test "shows chosen resource", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = get conn, ship_path(conn, :show, ship)
    assert html_response(conn, 200) =~ "Show ship"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, ship_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = get conn, ship_path(conn, :edit, ship)
    assert html_response(conn, 200) =~ "Edit ship"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = put conn, ship_path(conn, :update, ship), ship: @valid_attrs
    assert redirected_to(conn) == ship_path(conn, :show, ship)
    assert Repo.get_by(Ship, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = put conn, ship_path(conn, :update, ship), ship: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit ship"
  end

  test "deletes chosen resource", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = delete conn, ship_path(conn, :delete, ship)
    assert redirected_to(conn) == ship_path(conn, :index)
    refute Repo.get(Ship, ship.id)
  end
end
