module Api
  module V1
    class HomeController < ApplicationController
      include AuxiliarMethods

      def index
        render 200, json: {cod: 200, status: "OK", message: {welcome: "Bem vindo ao jogo da Sonda Exploradora da NASA",
                                                             hint: "Use apenas metodos POST nas rotas",
                                                             routes: [routes]
                                                            }
                          }
      end
    end
  end
end