require "bundler/setup"

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "redcarpet"

configure do
  enable :sessions
  set :session_secret, 'super secret'
end

root = File.expand_path("..", __FILE__)

get "/" do
  @files = Dir.glob(root + "/data/*").map do |path|
    File.basename(path)
  end

  erb :index
end

def render_markdown(content)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(content)
end

get "/:filename" do
  filename = params[:filename]
  file_path = root + "/data/" + filename

  if File.file?(file_path)
    content = File.read(file_path)

    if filename.match?(/.md$/) 
      render_markdown(content)
    else
      headers['Content-Type'] = 'text/plain'    
      content
    end
  else
    session[:message] = "#{filename} does not exist."
    redirect "/"
  end
end
