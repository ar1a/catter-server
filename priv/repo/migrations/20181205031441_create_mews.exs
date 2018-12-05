defmodule Catter.Repo.Migrations.CreateMews do
  use Ecto.Migration

  def change do
    create table(:mews, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :string

      timestamps()
    end

  end
end
