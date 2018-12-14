module AuxiliarMethods
  extend ActiveSupport::Concern

  def routes
    routes = {
        "/api/v1/": "Página principal, que exibe as boas vindas ao jogo"
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

  def example
    example = {key: "movimentos", value: "GE, M, M, M, GD, M, M"}
    example
  end
end