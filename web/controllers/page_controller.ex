defmodule EliteDangerousShipDesigner.PageController do
  use EliteDangerousShipDesigner.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
