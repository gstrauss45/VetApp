class ApplicationController < ActionController::Base
    include Pundit
    before_action :authenticate_

    def index
        response = request_api("http://localhost:8080/index", "post", nil)
        @role = response.body
    end

    private

    def request_api(uri, method, body)
        uri = URI(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        if method == "post"
            request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
        elsif method == "get"
            request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
        end
        request['Authorization'] = cookies[:auth_token]
        if body
            request.body = body.to_json
        end
        return http.request(request)
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    end

    def authenticate_
        if !cookies[:auth_token]
            render 'create_account'
        end
    end
end
