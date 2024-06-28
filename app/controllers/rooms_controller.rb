class RoomsController < ApplicationController
  def show
    signed_in

    @messages = Message.all
  end

  private
  
  def signed_in
    cookie.signed[:user_id] = User.first.id
  end
end
