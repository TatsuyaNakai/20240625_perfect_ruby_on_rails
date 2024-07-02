class StatusController < ApplicationController
  # フック
  skip_before_action :authenticate

  # メソッド
  def show
    render json: { status: 'ok' }
  end
end
