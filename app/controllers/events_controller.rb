class EventsController < ApplicationController
  skip_before_action :authenticate, only: %i[show]

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

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path(@event), notile: 'イベントを更新しました'
    else
      respond_to { |format| format.js }
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])

    @event.destroy!
    redirect_to root_path, notice: 'イベントを削除しました'
  end

  private
  
  def event_params
    params.require(:event).permit(:name, :place, :started_at, :ended_at, :content)
  end
end
