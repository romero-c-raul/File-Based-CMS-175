# 2. Getting Started
  - Set up a project and add a placeholder route to make sure everything is ready for the rest of the project

  - ## Requirements
    1. When a user visits the path "/", the app should display the text "Getting started"

  - ## Implementation (--Mine--)
    - Setup a Gemfile that requires Sinatra, Sinatra Contrib, and Erubis
    - Create an .rb file
      - File should require "bundler/setup," "sinatra," and "sinatra/reloader" at the top
      - Define a "/" route that returns the string "
    - Run "bundler install" on terminal to install dependencies

  - ## Implementation (--Launchschool--)
    1. Create a new directory on your computer for this project.
    2. Within this directory, create a Gemfile and within it, list the two dependencies needed by the application initially: sinatra and sinatra-contrib.
    3. Create a file to contain the application called cms.rb.
    4. Ensure you can install all dependencies by running bundle install within the project's directory.
    5. Ensure that you can start the Sinatra application by running ruby cms.rb.


# 3. Adding an Index Page
  - ## Requirements
    1. When a user visits the home page, they should see a list of the documents in the CMS: history.txt, changes.txt and about.txt

  - ## Implementation (--Mine--)
    - Create a directory filesystem in root
      - Create files history.txt, changes.txt, and about.txt
    - In our "/" route
      - Instead of displaying "Getting started.", we will now display the list of documents inside the
        filesystem folder
        - Need to iterate through filesystem directory and obtain the name of all the files within it
        - Store those file names in an array
          - Display files in a view template named "home.erb"

  - ## Implementation (--Launchschool--)
    1. Create a data directory in the same directory as your Sinatra application. Within the data directory, create three text files with following names: history.txt, changes.txt and about.txt.

    2. Use methods from the File class and the Dir class to get a list of documents. Together, these classes provide many useful methods for manipulating file names, file paths, and directories.

    3. Use an ERB template to render the list of documents.


# 4. Viewing Text Files
  - ## Requirements 
    1. When a user visits the index page, they are presented with a list of links, one for each document in the CMS
    2. When a user clicks on a document link in the index, they should be taken to a page that displays the content of the file whose name was clicked
    3. When a user visits the path `/history.txt`, they will be presented with the content of the document `history.txt`
    4. The browser should render a text file as a plain text file

  - ## Implementation (--Mine--)
    1. On `index.erb`, add an href attribute that points to the path that corresponds to that particular file
    2. On `cms.rb`, add a route that returns the resource we are looking for ex: ` get "/:file" do` etc..
      - Within this route, we need to obtain the contents of the file we are requesting and save it to a variable
      - Structure the text in a readable format and return it

  - ## Implementation (--Launchschool--)
    1. Update views/index.erb to make each document name a link
    2. Add a new route that will handle viewing the contents of documents
    3. In the new route, read the contents of the document to be viewed
    4. Set an appropriate value for the `Content-Type` header to tell browsers to display response in plain text
