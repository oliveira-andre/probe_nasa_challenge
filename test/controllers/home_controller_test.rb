module Api
  module V1
    class HomeControllerTest < ActionDispatch::IntegrationTest
      test 'show the initial page' do
        post(
            api_v1_path,
        )
      end
    end
  end
end