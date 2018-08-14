class WelcomeController < ApplicationController
  def index
    render json: { message: 'welcome' }
  end
end
