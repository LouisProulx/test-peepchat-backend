defmodule Peepchat.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Peepchat.Repo
  alias Peepchat.User

  def for_token(user = %User{}), do: { :ok, "User#{user.id}"}
  def for_token(_), do: { :error, "Unknown ressource type"}

  def from_token("User:" <> id), do: { :ok, Repo.get(User,id) }
  def from_token(_), do: { :error, "Unknown ressource type" }

end