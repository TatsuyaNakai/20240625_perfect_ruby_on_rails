class UpcaseMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    body.each{ |s| s.gsub!(/ruby/i,"RUBY") }

    return [status, headers, body]
  end
end