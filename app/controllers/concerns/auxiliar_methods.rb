module AuxiliarMethods
  extend ActiveSupport::Concern

  def routes
    routes = {
        "/api/v1/": "Página principal, que exibirá a mesma menssagem que você está vendo agora"
    }
    routes
  end

  def directions
    directions = {E: "Esquerda", D: "Direita", C: "Cima", B: "Baixo"}
    directions
  end

  def moviments
    moviments = {M: "mover na direção que está apontado", GE: "girar 90 graus à esquerda", GD: "girar 90 graus à direta"}
    moviments
  end
end