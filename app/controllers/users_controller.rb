class UsersController < ApplicationController

  def show 
    User.find(current_user.id)
  end

end
