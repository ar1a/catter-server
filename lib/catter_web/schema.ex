defmodule CatterWeb.Schema do
  use Absinthe.Schema

  query do
    # FIXME: doesn't error properly if provided with a malformed UUID
    field :mew, non_null(:mew) do
      arg(:id, non_null(:id))

      resolve(fn _, %{id: id}, _ ->
        with mew <- Catter.Posts.get_mew(id) do
          {:ok, mew}
        else
          _ -> {:error, "Cannot be found"}
        end
      end)
    end

    field :mews, list_of(non_null(:mew)) do
      resolve(fn _, _, _ -> {:ok, Catter.Posts.list_mews()} end)
    end
  end

  object :mew do
    field(:id, non_null(:id))
    field(:content, non_null(:string))
  end
end
