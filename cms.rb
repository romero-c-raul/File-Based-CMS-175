require "bundler/setup"
require "sinatra"
require "sinatra/reloader"

get "/" do

  @files = Dir.entries("filesystem").select do |file| 
    File.file?("filesystem/#{file}")
  end

  erb :home
end