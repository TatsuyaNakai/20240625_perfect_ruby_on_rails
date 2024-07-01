class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @events = Event.all.order(started_at: :desc)
  end
end
