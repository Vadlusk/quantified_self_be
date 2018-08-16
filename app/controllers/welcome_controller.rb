class WelcomeController < ApplicationController
  def welcome
    render json: { message: 'welcome' }
  end
end
