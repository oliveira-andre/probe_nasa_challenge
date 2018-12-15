module Api
  module V1
    class ProbeController < ApplicationController
      before_action :set_probe
      before_action :valid_params, only: :moviments

      def reset
        render 200, json: {cod: 200, status: "OK", message: "A sonda foi resetada com sucesso"} if @probe.destroy
      end

      def moviments
        @moviments.each do |moviment|
          render 400, json: {cod: 400, status: "Bad Request", message: "Insira parametros válidos"} unless moviment.upcase == "GE" || moviment.upcase == "GD" || moviment.upcase == "M"
          turn_around(moviment.upcase) unless moviment.upcase == "M"
          move(moviment.upcase) if moviment.upcase == "M"
        end
      end

      def position
        render 200, json: {cod: 200, status: "OK", message: {"sua posição atual é": {x: @probe.x_axis, y: @probe.y_axis}}}
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
        @moviments = [params[:moviments]] unless params[:moviments].nil?
        render 400, json: {cod: 400, status: "Bad Request", message: "Insira os parametros para mover a sonda"} if @moviments == [""] || params[:moviments].nil?
      end
    end
  end
end