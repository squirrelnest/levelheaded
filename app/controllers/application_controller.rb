class ApplicationController < Sinatra::Base

  before do
    @user = User.find_by(id: session[:id])
  end

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    redirect '/chowtables'
  end

end
