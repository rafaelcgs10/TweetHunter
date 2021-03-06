Tweet Hunter
===========

[![TweetHunter](https://img.shields.io/circleci/build/gh/rafaelcgs10/TweetHunter?style=for-the-badge)](https://circleci.com/gh/rafaelcgs10/TweetHunter)
[![Codacy coverage](https://img.shields.io/codacy/coverage/0a6bda44c9aa4a7185a7886de0667e80?style=for-the-badge)](https://app.codacy.com/manual/rafaelcgs10/TweetHunter?utm_source=github.com&utm_medium=referral&utm_content=rafaelcgs10/TweetHunter&utm_campaign=Badge_Grade_Dashboard)
[![Website](https://img.shields.io/website?label=Go%20to%20Tweet-Hunter&style=for-the-badge&up_message=online&url=https%3A%2F%2Ftweet-hunter.herokuapp.com%2F)](https://tweet-hunter.herokuapp.com)

This application was made using Ruby on Rails 6 with a lot of nice gems!

To check the application working access: [Tweet Hunter](https://tweet-hunter.herokuapp.com)

## Steps to run this project locally:

1. [Dependencies] Check if you have installed Ruby 2.6.0, Bundler 2 (or greater), Node 8.16.0 (or greater), redis and postgres (check if these last two are running).

    You may want to install Ruby 2.6.0 using rvm as well Node 8.16.0 with nvm!

    * If you installed Ruby 2.6.0 using rvm, you may need to update Bundler with `gem update --bundler`

    * Install yarn from npm: `sudo npm install --global yarn`

    * You need to install a system package called  `libpq`something. In Arch Linux is called `libpqxx`, in Ubuntu you may also install `libpqxx-dev`.

2. Clone and `cd` this project.

	Always run the commands from the project folder!

3. Run `bundle install`.

4. Run `figaro install`.

5. Insert your Twitter API credentials in `config/application.yml`, like so:

    ```
    consumer_key: XXXXXX
    consumer_secret: XXXXXXX
    access_token: XXXXXXXX
    access_secret: XXXXXXXX
    ```

6. Create a database in postgres called tweet_hunter.

You may customize who is the user in `config/database.yml`, but you may also skip this!

7. Run `yarn install --check-files`.

8. Run `rake db:migrate` from the project folder.

9. Run `rake environment tweet_stream:start` in another terminal.

10. Run `INTERVAL=0.1 QUEUE=* COUNT=2 rake environment resque:work` in another terminal.

11. Run `rails s` and check http://localhost:3000/ .

12. Run tests with `rspec`.

## A brief list of the tools used:

* Ruby 2.6

* Rails 6

* CircleCI

* Codacy

* RSpec

* Rubocop

* Resque and Resque-scheduler (gems)

* Solargraph (Language Server)

* TreeTop (gem)

* ActsAsParanoid (gem)

* Twitter API (gem)

* VCR (gem)

* Bootstrap

* Sorbet

* Heroku
