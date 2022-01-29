defmodule Wabanex.Training do
  # "use" import macros
  use Ecto.Schema
  # import functions
  import Ecto.Changeset

  alias Wabanex.{User, Exercise}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Module variable - It is used in line cast(params, @fields)
  @fields [:start_date, :end_date, :user_id]

  # struct
  schema "trainings" do
    field :start_date, :date
    field :end_date, :date

    belongs_to :user, User
    has_many :exercises, Exercise

    timestamps()
  end

  def changeset(params) do
    # Same as %Wabanex.User{} (the module)
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:user_id])
    |> cast_assoc(:exercises)
  end
end
