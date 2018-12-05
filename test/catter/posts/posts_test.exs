defmodule Catter.PostsTest do
  use Catter.DataCase

  alias Catter.Posts

  describe "mews" do
    alias Catter.Posts.Mew

    @valid_attrs %{content: "some content"}
    @update_attrs %{content: "some updated content"}
    @invalid_attrs %{content: nil}

    def mew_fixture(attrs \\ %{}) do
      {:ok, mew} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_mew()

      mew
    end

    test "list_mews/0 returns all mews" do
      mew = mew_fixture()
      assert Posts.list_mews() == [mew]
    end

    test "get_mew!/1 returns the mew with given id" do
      mew = mew_fixture()
      assert Posts.get_mew!(mew.id) == mew
    end

    test "create_mew/1 with valid data creates a mew" do
      assert {:ok, %Mew{} = mew} = Posts.create_mew(@valid_attrs)
      assert mew.content == "some content"
    end

    test "create_mew/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_mew(@invalid_attrs)
    end

    test "update_mew/2 with valid data updates the mew" do
      mew = mew_fixture()
      assert {:ok, %Mew{} = mew} = Posts.update_mew(mew, @update_attrs)
      assert mew.content == "some updated content"
    end

    test "update_mew/2 with invalid data returns error changeset" do
      mew = mew_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_mew(mew, @invalid_attrs)
      assert mew == Posts.get_mew!(mew.id)
    end

    test "delete_mew/1 deletes the mew" do
      mew = mew_fixture()
      assert {:ok, %Mew{}} = Posts.delete_mew(mew)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_mew!(mew.id) end
    end

    test "change_mew/1 returns a mew changeset" do
      mew = mew_fixture()
      assert %Ecto.Changeset{} = Posts.change_mew(mew)
    end
  end
end
