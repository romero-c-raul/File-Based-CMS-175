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


# 5. Adding Tests
  - ## Requirements
    1. Write tests for the routes that the application already supports, run them and you should see something similar

  - ## Implementation (--Mine--)
    1. Setup test file
      - Within test file:
        - Set `ENV["RACK_ENV"] = "test"`
        - Require libraries that are needed
        - Require rack application
        - Require an application that subclasses from `Minitest::Test`
        - Define a method `app` that returns an instance of a Rack application
    2. Write tests
      - Currently there are two routes defined: `"/"` and `"/:filename"`
      - Test for `"/"` will assert for:
        - Status code: 200
        - Content-Type header: "text/plain"
        - body: text within .txt file
    3. Run tests
  
  - ## Implementation (--Launchschool--)
    1. Add minitest and rack-test to the project's Gemfile and run bundle install to install them.

    2. Create a test directory within the project. Inside that directory, create a file called cms_test.rb and add to it any testing setup code.

    3. Write a test that performs a GET request to / and validates the response has a successful response and contains the names of the three documents.

    4. Write a test that performs a GET request to /history.txt (or another document of your choosing) and validates the response is successful and contains some of the content of that document.


# 6. Handling Requests for Nonexisting documents
  - # Requirements
    1. When a user attempts to view a document that does not exist, they should be redirected to the index page and shown the message: $DOCUMENT does not exist.
    2. When the user reloads the index page after seeing an error message, the message should go away

  - ## Implementation (--Mine--)
    1. Enable sessions
    2. Determine if file exists within the `data` folder
      - If file exists, return the contents as before
      - If file does not exist:
        - Add the key-value pair error: "This resource does not exist" to our session object
        - redirect to "/"
    3. When redirected, message should flash
      - To do this, we need to go to our index template, and display the message if a message exist.
        - After that, we need to delete the message so it does not re-appear everytime we refresh the page

    ### Tests (--Mine--): 
      - Write test for status code 302, since if file is not found we will be redirected
      - Write test for content type
      - Write test for body: should include message that the current file does not exist

  - ## Implementation (--Launchschool--)
      1. Check to see if a file exists before attempting to read its content
        - We do this because this returns a 500 error, that the `not_found` route cannot handle
      2. Enable sessions in application so we can persist data between requests
      3. If a document doesn't exist, store an error message in the session and redirect the user.
      4. In the index template, if there is an error message, print it out and delete it


- # 7. Viewing Markdown Files
  - ## Requirements
    1. When a user views a document written in Markdown format, the browser should render the HTML version of the document's content

  - ## Implementation (--Mine--)
    1. Change `about.txt` to `about.md`
    2. Define a helper method that returns a Redcarpet::Markdown instance
    3. If you are requesting a markdown file
      - Call method `render` on the `Redcarpet::Markdown` instance and pass the text as an argument

  - ## Implementation (--Launchschool--)
    1. Rename about.txt to about.md Add some Markdown-formatted text to this file.
    2. Create a helper method called render_markdown that takes a single argument, the text to be processed, and returns rendered HTML.
    3. When a user is viewing a file with the extension md, render the file's content using RedCarpet and return the result as the response's body.


- # 8. Editing Document Content
  - ## Requirements
    1. When a user views the index page, they should see an edit link next to each document name
    2. When a user clicks the edit lnk, they should be taken to an edit page for the appropriate document
    3. When a user views the edit page for a document, that document's content should appear within the text area
    4. When a user edits the document's content and cliks "Save Changes" button, they are redirected to the index page and are shown a message: $Filename has been updated

  - ## Implementation (--Mine--)
    1. Add a link next to each document name that takes you to `"/:document/edit"`
    2. Edit page of document should include:
      - Edit content of `current file` header
      - A textbox that has contents already in the file
        - This is a form that will be sent using a post request
    3. Create a route `get "/:document/edit"` that:
      - Sets the session message to `"filename" has been updated`
      - Redirects to index page

    - ### Tests
      - Write a test for routes:
        - `get "/:filename/edit`
          - Should return `202 status`
          - Should include `Edit content of "current document" `
        - `post "/:filename"`
          - Should return `302 status`
          - Store contents that were written to file (body of file?)

          - redirect to header["Location"]
          - Should return `202 status`
          - Check that contents written on file are indeed the body of the file