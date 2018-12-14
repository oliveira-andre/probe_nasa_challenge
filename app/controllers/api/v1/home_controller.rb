module Api
  module V1
    class HomeController < ApplicationController
      include AuxiliarMethods

      def index
        render 200, json: {cod: 200, status: "OK", message: {welcome: "Bem vindo ao jogo da Sonda Exploradora da NASA",
                                                             hint: "Use apenas metodos POST nas rotas",
                                                             routes: routes
                                                            }
                          }
      end

      def instructions
        render 200, json: {cod: 200, status: "OK", message: { directions: directions,
                                                              moviments: moviments,
                                                              param_example: example,
                                                              hint: "recomendamos é usar os parametros no body do método POST"
                                                            }
                          }
      end

      def not_found
        render 404, json: {cod: 404, status: "not_found", message: {error: "Essa rota não existe, cheque nossa lista de rotas abaixo",
                                                             hint: "Use apenas metodos POST nas rotas",
                                                             routes: routes
                                                            }
                          }
      end
    end
  end
end