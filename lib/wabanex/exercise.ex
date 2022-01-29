defmodule Wabanex.Exercise do
  # "use" import macros
  use Ecto.Schema

  # import functions
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Module variable - It is used in line cast(params, @fields)
  @fields [:name, :protocol_description, :repetitions, :youtube_video_url]

  # struct
  schema "exercises" do
    field :name, :string
    field :youtube_video_url, :string
    field :protocol_description, :string
    field :repetitions, :string

    belongs_to :training, Wabanex.Training

    timestamps()
  end

  def changeset(exercise, params) do
    # Same as %Wabanex.User{} (the module)
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
