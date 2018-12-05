defmodule CatterWeb.Schema do
  use Absinthe.Schema

  query do
    field :mew, :mew do
      arg(:id, non_null(:id))

      resolve(fn _, %{id: id}, _ ->
        with mew <- Catter.Posts.get_mew(id) do
          {:ok, mew}
        else
          _ -> {:error, "Cannot be found"}
        end
      end)
    end
  end

  object :mew do
    field(:id, non_null(:id))
    field(:content, non_null(:string))
  end
end
