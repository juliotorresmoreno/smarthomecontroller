class AuthMiddleware
    def initialize app
        @app = app
    end

    def call env
        @status, @headers, @response = @app.call(env)
        [@status, @headers, @response]
    end
end