defmodule CatterWeb.Router do
  use CatterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CatterWeb do
    pipe_through :api
  end
end
