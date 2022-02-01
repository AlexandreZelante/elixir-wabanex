defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = Wabanex.IMC.calculate(params)

      expected_response = {:ok, %{"Alexandre" => 24.508945765204302, "Bernal" => 49.30555555555556, "Jose" => 28.804413972169254, "João" => 48.36009672019344}}

      assert response === expected_response
    end

    test "when the wrong file name is given, returns an error" do
      params = %{"filename" => "banana.csv"}

      response = Wabanex.IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
