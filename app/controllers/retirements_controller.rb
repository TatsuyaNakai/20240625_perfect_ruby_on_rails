class RetirementsController < ApplicationController
  def new
  end

  def destroy
    @user = current_user
    if @user.destroy
      reset_session
      redirect_to root_path, '退会が完了しました'
    else
      respond_to { |format| format.js }
    end
  end
end
