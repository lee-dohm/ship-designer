defmodule ShipDesigner.DesignControllerTest do
  use ShipDesigner.ConnCase

  alias ShipDesigner.Design
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, design_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing designs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, design_path(conn, :new)
    assert html_response(conn, 200) =~ "New design"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, design_path(conn, :create), design: @valid_attrs
    assert redirected_to(conn) == design_path(conn, :index)
    assert Repo.get_by(Design, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, design_path(conn, :create), design: @invalid_attrs
    assert html_response(conn, 200) =~ "New design"
  end

  test "shows chosen resource", %{conn: conn} do
    design = Repo.insert! %Design{}
    conn = get conn, design_path(conn, :show, design)
    assert html_response(conn, 200) =~ "Show design"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, design_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    design = Repo.insert! %Design{}
    conn = get conn, design_path(conn, :edit, design)
    assert html_response(conn, 200) =~ "Edit design"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    design = Repo.insert! %Design{}
    conn = put conn, design_path(conn, :update, design), design: @valid_attrs
    assert redirected_to(conn) == design_path(conn, :show, design)
    assert Repo.get_by(Design, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    design = Repo.insert! %Design{}
    conn = put conn, design_path(conn, :update, design), design: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit design"
  end

  test "deletes chosen resource", %{conn: conn} do
    design = Repo.insert! %Design{}
    conn = delete conn, design_path(conn, :delete, design)
    assert redirected_to(conn) == design_path(conn, :index)
    refute Repo.get(Design, design.id)
  end
end
