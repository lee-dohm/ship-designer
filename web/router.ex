defmodule ShipDesigner.Router do
  use ShipDesigner.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShipDesigner do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/designs", DesignController
    resources "/modules", ModuleController, only: [:index, :show]
    resources "/ships", ShipController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShipDesigner do
  #   pipe_through :api
  # end
end
