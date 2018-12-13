module API
  module V1
    class HomeController < ApplicationController
      def index
        render 200, json: {cod: 200, status: "OK", message: "Bem vindo ao desafio da Sonda Exploradora da NASA"}
      end
    end
  end
end