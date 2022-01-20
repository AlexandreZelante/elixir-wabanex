defmodule Wabanex.Users.Create do
  alias Wabanex.{Repo, User} # Same as 2 lines with alias Wabanex.Repo and Wabanex.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
