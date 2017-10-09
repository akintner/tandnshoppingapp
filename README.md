# README

* Rails version: 5.1.3
* Ruby version: 2.3.1

* System dependencies: This app requires postgresql as a database. All other gem dependencies are listed in the Gemfile and can be downloaded by running `bundle` from your terminal.

* General Configuration: clone down this repo, `bundle` to ensure all the Gemfile dependencies are loaded on your local computer, and then you will need to load and migrate the database.

* Database Configuration: once you have cloned the repo and bundled for gems, you will have to set up the database on your local machine. To do this, please run the following commands from your terminal in order:
<br>
rake db:create (this will create the two postgresql databases needed to run the project)  
rake db:migrate (this will load all the database tables with the information specified in the migration files)  
rake db:test:prepare (this will ensure that you can run the test specs)  

* How to run the test suite: once you have set up the database, you can run the test specs by simply typing `rspec` and `rake test` into the terminal. 

* How to run the program from your local browser: if you would like to run the program from your browser, please type `puma` or `rails server` into the terminal and then open up a browser of your choice and type in the following basic URL `localhost:3000/`, which will take you to the project description and dahsboard. The shopping app is fully functional, and you can shop around as you like. Enjoy!