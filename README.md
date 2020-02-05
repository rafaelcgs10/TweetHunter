Tweet Hunter
===========

[![TweetHunter](https://img.shields.io/circleci/build/gh/rafaelcgs10/TweetHunter?style=for-the-badge)](https://circleci.com/gh/rafaelcgs10/TweetHunter)
[![Codecov](https://img.shields.io/codecov/c/gh/rafaelcgs10/TweetHunter?style=for-the-badge)](https://codecov.io/gh/rafaelcgs10/TweetHunter)
![Website](https://img.shields.io/website?label=Go%20to%20Tweet-Hunter&style=for-the-badge&up_message=online&url=https%3A%2F%2Ftweet-hunter.herokuapp.com%2F)


This application was made using Ruby on Rails 6 with a lot of nice gems!

To check the application working access: tweet-hunter.herokuapp.com

Steps to run this project locally:

1. Check with you have installed Ruby 2.6, Rails 6, redis and postgres (check if these last two are running).
   You may want to install Ruby 2.6 using rvm!
   
2. Clone and cd this project.

3. Run bundle install

4. Create a databse in postres called myDB
   make sure that the user is called rafael and has the passowrd 123456.
   You may also customize this in config/database.yml

5. Run rake db:migrate from the project folder

A brief list of tools used:

* Ruby 2.6

* Rails 6

* CircleCI

* Codecov

* Resque and Resque-scheduler (gems)

* RSpec 3.9

* Solargraph (Language Server)

* Rubocop

* ActsAsParanoid (gem)

* Twitter API (gem)

* VCR (gem)

* Bootstrap

* Heroku
