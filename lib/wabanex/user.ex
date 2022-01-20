defmodule Wabanex.User do
  use Ecto.Schema # "use" import macros
  import Ecto.Changeset # import functions

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:email, :password, :name] # Module variable

  # struct
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end


  def changeset(params) do
    %__MODULE__{} # Same as %Wabanex.User{} (the module)
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
