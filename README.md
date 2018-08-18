# Quantified Self
is a project designed to teach how seperate backend and frontend applications interact.  Given a basic frontend application written in React (https://github.com/Vadlusk/quantified-self-fe), students are tasked with creating three matching backends, the first in Rails, the second in Express, and the third in a language of our choice.  
The application's functionality is that of a basic calorie counter.  The user can add foods to a list and then add foods from that list to any of four meals.  Each food is assigned a number of calories which is subtracted from remaining calories for each meal and for the day (all meals added together).

# Versions
Ruby 2.4.4   
Rails 5.2.1


# Setup
1. Clone or fork this repo.
2. Move into the directory.
3. `Bundle`
4. `rake db:create db:schema:load db:seed`

To run the test suite, type `rspec`.   
To spin up a local server, type `rails s`.

# Endpoints

## Foods
The following endpoints return either a food object or message that the action was successful.  
Food objects are returned in the following format:   
  { "id": integer, "name": string, "calories": integer }

GET /api/v1/foods

returns a list of all foods in the database

GET /api/v1/foods/:id

returns the food with that id number

POST /api/v1/foods

creates a food with paramaters: { "food": { "name": "Name of food here", "calories": "Calories here"} }    
all fields are required

PATCH /api/v1/foods/:id

edits an existing food with same parameters as above.   
no fields are required. 

DELETE /api/v1/foods/:id

deletes the food with that id number

## Meals
The following endpoints return either a meal object or message that the action was successful.  
Meal objects are returned in the following format:   
  { "id": integer "name": string, "foods": array_of_food_objects }

GET /api/v1/meals

returns all the meals in the database with associated foods

GET /api/v1/meals/:meal_id/foods

returns the meal with that id number

POST /api/v1/meals/:meal_id/foods/:id

associates the food with that id with the meal with that id

DELETE /api/v1/meals/:meal_id/foods/:id

removes the association between that food and that meal
