defmodule Catter.Repo do
  use Ecto.Repo,
    otp_app: :catter,
    adapter: Ecto.Adapters.Postgres
end
