defmodule Wabanex.User do
  # "use" import macros
  use Ecto.Schema
  # import functions
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  # Module variable
  @fields [:email, :password, :name]

  # struct
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    # Same as %Wabanex.User{} (the module)
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
