require 'rack-flash'

class ApplicationController < Sinatra::Base

  before do
    @user = User.find_by(id: session[:id])
  end

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  use Rack::Flash, :sweep => true

  configure do
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end


  get '/' do
    redirect '/chowtables'
  end

end
