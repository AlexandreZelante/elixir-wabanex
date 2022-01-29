# Just like a routes file
defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias WabanexWeb.Resolvers

  alias Resolvers.User, as: UserResolver
  alias Resolvers.Training, as: TrainingResolver

  alias WabanexWeb.Schema.Types

  import_types Types.Custom.UUID4
  import_types Types.User
  import_types Types.Training

  object :root_query do
    # Even though the get_user is in snake case, the absinthe turns the "route" to camel case
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      # returns the function to get users sending two parameters
      resolve &UserResolver.get/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      # returns the function to get users sending two parameters
      resolve &UserResolver.create/2
      middleware TranslateErrors
    end

    field :create_training, type: :training do
      arg :input, non_null(:create_training_input)

      # returns the function to get users sending two parameters
      resolve &TrainingResolver.create/2
      middleware TranslateErrors
    end
  end
end
