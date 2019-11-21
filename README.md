# **Happy Hour Backend**

Our app provides a virtual bar experience for users where users can choose a seat at the bar, buy a drink, favorite a drink, and create their own drink.

---

## Motivation
Who doesn't appreciate a good happy hour?

## Features
- Search ingredients

- Filter by drink category
- Buy a drink
- Favorite a drink
- Create own drink
- Watch TV
- Choose a seat
- Drink your cocktail
- Make account and log in
- Validations on account information

## Instructions
1. A user can log in or sign up

2. Choose a seat to sit
3. View menu with drink names, ingredients, and drink creator
4. Can filter drinks by category on the menu
5. Can click the heart to favorite drink which will show up in side bar
6. Can click drink name to buy
7. After buying a user can close the menu and drink will appear on bar
8. User can click on the drink to chug it
9. On the menu, a user can click the "Create a Drink" button
10. This page allows the user to choose a category, name, ingredients and instructions for their drink
11. User can choose a maximum of 5 ingredients
12. Once the drink is made, the user will be redirected to the bar
13. The user's newly created drink will now be shown on the menu

## Technologies
- API: (https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita)
- Ruby on Rails
- JWT Auth
- BCrypt
- ActiveRecord
- ActiveModel Serializers
- RestClient

## Installation
*To view live version, go to this URL:[]()*

*To view locally, follow the instructions below*
1. Clone repository

  ```
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
  rails server
  ```
- Server needs to run on http://localhost:3000

2. Go to frontend repository to view frontend installation

---
***Authors: [Kimberly Bone](https://github.com/kimberlybone) & [Matt Werner](https://github.com/mrwerner392)***
