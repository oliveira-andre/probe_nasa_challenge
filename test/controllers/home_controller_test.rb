module Api
  module V1
    class HomeControllerTest < ActionDispatch::IntegrationTest
      test "show the initial page" do
        puts "success post into initial page"
        post(api_v1_home_path)
        assert_response :ok
      end

      test "show the instructions page" do
        puts "success post into instructions page"
        post(api_v1_instructions_path)
        assert_response :ok
      end

      test "show the not_found page by any post" do
        puts "not_found post into instructions page"
        post("/api/v1/not_found")
        assert_response :not_found
      end

      test "show the not_found page by home post" do
        puts "not_found post into home page"
        post("/")
        assert_response :not_found
      end

      test "show the not_found page by any get" do
        puts "not_found into any get page"
        get("/not_found")
        assert_response :not_found
      end

      test "show the not_found page by home get" do
        puts "not_found into home get page"
        get("/")
        assert_response :not_found
      end
    end
  end
end