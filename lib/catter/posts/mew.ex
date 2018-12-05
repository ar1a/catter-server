defmodule Catter.Posts.Mew do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "mews" do
    field(:content, :string)

    timestamps()
  end

  @doc false
  def changeset(mew, attrs) do
    mew
    |> cast(attrs, [:content])
    |> validate_required([:content])
    |> validate_length(:content, max: 280)
  end
end
