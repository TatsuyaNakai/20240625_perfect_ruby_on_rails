class TicketsController < ApplicationController
  def new
    current_user
  end

  def create
    event = Event.find(params[:event_id])

    @ticket = current_user.tickets.build do |ticket|
               ticket.event = event
               ticket.comment = params[:ticket][:comment]
             end
    if @ticket.save
      redirect_to event_path(event), notice: 'このイベントに参加表明しました'
    else
      respond_to { |format| format.js }
    end
  end

  def destroy
    ticket = current_user.tickets.find_by!(event_id: params[:event_id])

    ticket.destroy!
    redirect_back(fallback_location: root_path, alert: 'イベント参加を取り消しました')
  end
end
