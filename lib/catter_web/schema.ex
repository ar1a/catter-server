defmodule CatterWeb.Schema do
  use Absinthe.Schema

  query do
    field :mew, :mew do
      arg(:id, non_null(:id))

      resolve(fn _, %{id: id}, _ ->
        mew =
          try do
            Catter.Posts.get_mew(id)
          rescue
            _ -> nil
          end

        {:ok, mew}
      end)
    end

    field :mews, list_of(non_null(:mew)) do
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

  def error_details(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, _} -> msg end)
  end
end
