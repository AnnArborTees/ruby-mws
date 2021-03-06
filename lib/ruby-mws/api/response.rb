module MWS
  module API

    class Response < Hashie::Rash
      
      def self.parse(body, name, params)
        return body unless body.is_a?(Hash)

        rash = self.new(body)
        handle_error_response(rash["error_response"]["error"]) unless rash["error_response"].nil?
        unless rash["#{name}_response"].nil?
          rash = rash["#{name}_response"]
        end

        if rash["#{name}_result"]
          rash = rash["#{name}_result"]
          # only runs mods if correct result is present
          params[:mods].each {|mod| mod.call(rash) } if params[:mods]
        end
        rash
      end

      def self.handle_error_response(error)
        msg = "#{error.code}: #{error.message}"
        msg << " -- #{error.detail}" unless error.detail.nil?
        raise ErrorResponse, msg
      end

    end

  end
end
