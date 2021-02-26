require "bundler/setup"

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

root = File.expand_path("..", __FILE__)

get "/" do
  @files = Dir.glob(root + "/data/*").map do |path|
    File.basename(path)
  end

  erb :index
end

def file_exists?(filename)
  Dir.entries("data").any? { |current_filename| current_filename == filename }
end

get "/:filename" do
  filename = params[:filename]

  if file_exists?(filename)
    file_path = root + "/data/#{filename}"
    headers['Content-Type'] = 'text/plain'
    
    File.read(file_path)
  else
    session[:error] = "#{filename} does not exist."
    redirect "/"
  end
end
