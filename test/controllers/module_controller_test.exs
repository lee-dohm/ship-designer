defmodule ShipDesigner.ModuleControllerTest do
  use ShipDesigner.ConnCase

  alias ShipDesigner.Module

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, module_path(conn, :index)
    assert html_response(conn, 200) =~ "Modules"
  end

  test "shows chosen resource", %{conn: conn} do
    module = Repo.insert! %Module{}
    conn = get conn, module_path(conn, :show, module)
    assert html_response(conn, 200) =~ "Category"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, module_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end
end
