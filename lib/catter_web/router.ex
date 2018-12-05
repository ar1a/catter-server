defmodule CatterWeb.Router do
  use CatterWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api" do
    pipe_through(:api)

    forward("/", Absinthe.Plug,
      schema: CatterWeb.Schema,
      json_codec: Jason
    )
  end
end
