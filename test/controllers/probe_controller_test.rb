module Api
  module V1
    class ProbeControllerTest < ActionDispatch::IntegrationTest
      test "Move with success the probe" do
        puts "Move with success the probe"
        moviment_params = {moviments: "GE, M, M"}
        post(api_v1_reset_path)
        post(api_v1_moviments_path, params: moviment_params)
        assert_response :ok
      end

      test "Invalid params" do
        puts "invalid params"
        moviment_params = {moviments: "error"}
        post(api_v1_reset_path)
        post(api_v1_moviments_path, params: moviment_params)
        assert_response :bad_request
      end

      test "Move to a invalid place negative x_axis" do
        puts "Move to a invalid place negative x_axis"
        moviment_params = {moviments: "GE, GE, M"}
        post(api_v1_reset_path)
        post(api_v1_moviments_path, params: moviment_params)
        assert_response :bad_request
      end

      test "Move to a invalid place positive x_axis" do
        puts "Move to a invalid place positive x_axis"
        moviment_params = {moviments: "M, M, M, M, M"}
        post(api_v1_reset_path)
        post(api_v1_moviments_path, params: moviment_params)
        assert_response :bad_request
      end

      test "Move to a invalid place negative y_axis" do
        puts "Move to a invalid place negative x_axis"
        moviment_params = {moviments: "GD, M"}
        post(api_v1_reset_path)
        post(api_v1_moviments_path, params: moviment_params)
        assert_response :bad_request
      end

      test "Move to a invalid place positive y_axis" do
        puts "Move to a invalid place positive x_axis"
        moviment_params = {moviments: "GE, M, M, M, M, M"}
        post(api_v1_reset_path)
        post(api_v1_moviments_path, params: moviment_params)
        assert_response :bad_request
      end

      test "Reset with success the probe" do
        puts "Reset with success the probe"
        post(api_v1_reset_path)
        assert_response :ok
      end

      test "show the actual path of the probe" do
        puts "show the actual path of the probe"
        post(api_v1_position_path)
        assert_response :ok
      end

    end
  end
end