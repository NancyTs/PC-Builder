# Introduction

The purpose of this project was to learn Ruby on Rails and keep track of my dream PC builds. You can create an account, login and start making PC Builds. When entering PC Parts name, an API lookup is happening in the background and suggests you the product name with autocomplete.
The API used is http://apigenius.io which is limited to 100 calls a month so the app might stop working if too many calls happen. Also it only returns one product per search, which limits this app to one product for each autocomplete suggestion, but it was the only free Product Search API.

# Technologies

* Ruby 2.7
* Rails 6

# Launch

The app is hosted on https://railspcbuilder.herokuapp.com

# TODO List

* ~~Connect the API to the APP~~
* Calculate estimated price of build
