module Api
  module V1
    class ProbeController < ApplicationController
      before_action :set_probe
      before_action :valid_params, only: :moviments

      include ProbeMoviments

      def reset
        render status: :ok, json: {cod: 200, status: "OK", message: "A sonda foi resetada com sucesso"} if @probe.destroy
      end

      def moviments
        @moviments.each do |moviment|
          move_probe = moviment.upcase.strip
          turn_around(move_probe) if move_probe == "GE" || move_probe == "GD"
          move if move_probe == "M"
        end
        render status: :ok, json: {cod: 200, status: "OK", message: "Sonda movida com sucesso"} unless @probe.invalid?
        render status: :bad_request, json: {cod: 400, status: "Bad Request", message: "Você se moveu para um local invalido, por favor resete seus movimentos"} if @probe.invalid?
      end

      def position
        render status: :ok, json: {cod: 200, status: "OK", message: {"sua posição atual é": {x: @probe.x_axis, y: @probe.y_axis}}}
      end

      private

      def set_probe
        @probe = Probe.last unless Probe.last.nil?
        @probe = Probe.create if Probe.last.nil?
      end

      def probe_params
        params.permit(:moviments)
      end

      def valid_params
        error = false
        @moviments = Array(params[:moviments].split(",")) unless params[:moviments].nil?
        @moviments.each { |moviment| error = valid_moviments(moviment.upcase.strip) }
        render status: :bad_request, json: {cod: 400, status: "Bad Request", message: "Insira os parametros para mover a sonda"} if @moviments == [""] || params[:moviments].nil?
        render status: :bad_request, json: {cod: 400, status: "Bad Request", message: "Insira parametros válidos"} if error
      end
    end
  end
end