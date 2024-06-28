class EventsController < ApplicationController
  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to event_path(@event), notile: 'イベントを作成しました'
    else
      respond_to { |format| format.js }
    end
  end

  private
  
  def event_params
    params.require(:event).permit(:name, :place, :started_at, :ended_at, :content)
  end
end
