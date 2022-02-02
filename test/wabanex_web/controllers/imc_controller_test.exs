defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, return the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      # Use connection to perform HTTP requests to test
      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Alexandre" => 24.508945765204302,
          "Bernal" => 49.30555555555556,
          "Jose" => 28.804413972169254,
          "João" => 48.36009672019344
        }
      }

      assert response == expected_response
    end

    test "when when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "banana.csv"}

      # Use connection to perform HTTP requests to test
      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}

      assert response == expected_response
    end
  end
end
