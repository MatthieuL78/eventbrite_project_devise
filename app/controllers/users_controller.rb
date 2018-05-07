class UsersController < ApplicationController

  def show 
    @event = user_event
  end

  private

  def user_event
    @my_event = Event.all.select{ |event| event.creator == current_user }
  end

end
