# Just like a routes file
defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver

  import_types WabanexWeb.Schema.Types.User

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
    end
  end
end
