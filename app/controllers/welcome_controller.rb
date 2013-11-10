class WelcomeController < ApplicationController
  def index
    @registrant = Registrant.new
  end
end
