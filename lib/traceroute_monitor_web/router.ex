defmodule TracerouteMonitorWeb.Router do
  use TracerouteMonitorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TracerouteMonitorWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TracerouteMonitorWeb do
    pipe_through :browser

    get "/", PageController, :home
    resources "/categories", CategoryController

  end

  # Other scopes may use custom stacks.
  # scope "/api", TracerouteMonitorWeb do
  #   pipe_through :api
  # end
end
