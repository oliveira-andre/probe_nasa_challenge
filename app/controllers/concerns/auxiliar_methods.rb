module AuxiliarMethods
  extend ActiveSupport::Concern

  def routes
    routes = {
        "/api/v1/": "Página principal, que exibirá a mesma menssagem que você está vendo agora"
    }
    routes
  end
end