defmodule Catter.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Catter.Repo

  alias Catter.Posts.Mew

  @doc """
  Returns the list of mews.

  ## Examples

      iex> list_mews()
      [%Mew{}, ...]

  """
  def list_mews do
    Repo.all(Mew)
  end

  @doc """
  Gets a single mew.

  Raises `Ecto.NoResultsError` if the Mew does not exist.

  ## Examples

      iex> get_mew!(123)
      %Mew{}

      iex> get_mew!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mew!(id), do: Repo.get!(Mew, id)

  @doc """
  Creates a mew.

  ## Examples

      iex> create_mew(%{field: value})
      {:ok, %Mew{}}

      iex> create_mew(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mew(attrs \\ %{}) do
    %Mew{}
    |> Mew.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mew.

  ## Examples

      iex> update_mew(mew, %{field: new_value})
      {:ok, %Mew{}}

      iex> update_mew(mew, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mew(%Mew{} = mew, attrs) do
    mew
    |> Mew.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Mew.

  ## Examples

      iex> delete_mew(mew)
      {:ok, %Mew{}}

      iex> delete_mew(mew)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mew(%Mew{} = mew) do
    Repo.delete(mew)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mew changes.

  ## Examples

      iex> change_mew(mew)
      %Ecto.Changeset{source: %Mew{}}

  """
  def change_mew(%Mew{} = mew) do
    Mew.changeset(mew, %{})
  end
end
