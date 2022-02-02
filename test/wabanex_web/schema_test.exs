defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "when a valid id is given, return the user", %{conn: conn} do
      params = %{email: "ale@x.com", name: "Ale", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{"data" => %{"getUser" => %{"email" => "ale@x.com", "name" => "Ale"}}}

      assert response == expected_response
    end

    test "when all params are avalid, creates the user", %{conn: conn} do
      params = %{email: "ale@x.com", name: "Ale", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      mutation = """
        mutation {
          createUser(input:{
            name: "Alexinho Special",
            email: "alexinho_speciall4@hotmail.com",
            password:"123456"
          }) {
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Alexinho Special"}}} =
               response
    end
  end
end
