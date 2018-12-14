module Api
  module V1
    class ProbeController < ApplicationController
      before_action :set_probe

      def reset
        render 200, json: {cod: 200, status: "OK", message: "A sonda foi resetada com sucesso"} if @probe.destroy
      end

      def moviments

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
    end
  end
end