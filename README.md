2. Getting Started
  - Set up a project and add a placeholder route to make sure everything is ready for the rest of the project

  - Requirements
    1. When a user visits the path "/", the app should display the text "Getting started"
---
  - Implementation (--Mine--)
    - Setup a Gemfile that requires Sinatra, Sinatra Contrib, and Erubis
    - Create an .rb file
      - File should require "bundler/setup," "sinatra," and "sinatra/reloader" at the top
      - Define a "/" route that returns the string "
    - Run "bundler install" on terminal to install dependencies

  - Implementation (--Launchschool--)
  1. Create a new directory on your computer for this project.
  2. Within this directory, create a Gemfile and within it, list the two dependencies needed by the application initially: sinatra and sinatra-contrib.
  3. Create a file to contain the application called cms.rb.
  4. Ensure you can install all dependencies by running bundle install within the project's directory.
  5. Ensure that you can start the Sinatra application by running ruby cms.rb.
---