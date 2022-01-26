defmodule Wabanex.Users.Create do
  # Same as 2 lines with alias Wabanex.Repo and Wabanex.User
  alias Wabanex.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
