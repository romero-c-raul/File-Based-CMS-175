2. Getting Started
  - Set up a project and add a placeholder route to make sure everything is ready for the rest of the project

  - Requirements
    1. When a user visits the path "/", the app should display the text "Getting started"
      
  - Implementation <!--Mine-->
    - Setup a Gemfile that requires Sinatra, Sinatra Contrib, and Erubis
    - Create an .rb file
      - File should require "bundler/setup," "sinatra," and "sinatra/reloader" at the top
      - Define a "/" route that returns the string "
    - Run "bundler install" on terminal to install dependencies