defmodule CatterWeb.Schema do
  use Absinthe.Schema

  def safe_call(func, args) do
    try do
      func.(args)
    rescue
      _ -> nil
    end
  end

  query do
    field :mew, :mew do
      arg(:id, non_null(:id))

      resolve(fn _, %{id: id}, _ ->
        {:ok, safe_call(&Catter.Posts.get_mew/1, id)}
      end)
    end

    field :mews, list_of(non_null(:mew)) do
      middleware(CatterWeb.Schema.Authentication)
      resolve(fn _, _, _ -> {:ok, Catter.Posts.list_mews()} end)
    end
  end

  mutation do
    field :register, :user do
      arg(:username, non_null(:string))
      arg(:email, :string)
      arg(:password, non_null(:string))

      resolve(fn _, args, _ ->
        case Catter.Accounts.create_user(args) do
          {:error, changeset} ->
            {:error, message: "Could not create user", details: error_details(changeset)}

          success ->
            success
        end
      end)
    end

    field :login, :session do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))

      resolve(fn _, %{username: username, password: password}, _ ->
        with {:ok, user} <- login(username, password),
             {:ok, jwt, _} <- Catter.Guardian.encode_and_sign(user) do
          {:ok, %{token: jwt}}
        end
      end)
    end
  end

  object :mew do
    field(:id, non_null(:id))
    field(:content, non_null(:string))
  end

  object :user do
    field(:id, non_null(:id))
    field(:username, non_null(:id))
    field(:email, :id)
  end

  object :session do
    field(:token, non_null(:string))
  end

  def error_details(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, _} -> msg end)
  end

  def login(username, password) do
    user = Catter.Repo.get_by(Catter.Accounts.User, username: username)
    IO.inspect(user)

    Comeonin.Argon2.check_pass(user, password)
  end
end

defmodule CatterWeb.Schema.Authentication do
  @behaviour Absinthe.Middleware

  def call(resolution, _config) do
    case resolution.context do
      %{current_user: _} ->
        resolution

      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "unauthenticated"})
    end
  end
end
