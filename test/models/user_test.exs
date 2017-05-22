defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "louis@example.com",
    password: "acde12345",
    password_confirmation: "acde12345"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(
      %User{},
      %{  email: "joe@example.com",
          password: "373739hhdf",
          password_confirmation: "4980354jgfh"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(
      %User{},
      %{  email: "joe@example.com",
          password: "373739hhdf"})
    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(
      %User{},
      %{  email: "joe@example.com",
          password: "1lh2d",
          password_confirmation: "1lh2d"})
    refute changeset.valid?
  end
end
