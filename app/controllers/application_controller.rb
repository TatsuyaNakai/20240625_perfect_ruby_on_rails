class ApplicationController < ActionController::Base
  # フック
  before_action :authenticate

  # メソッド
  helper_method %i[logged_in? current_user]

  # rescue_fromは後に登録したものから順番に判定されます。
  # 以下の場合は、初めにActiveRecord::RecordNotFound, ActionController::RoutingErrorかどうかを評価します。
  # 次に、それ以外のエラーについてはerror500を実施する。という構造になります。
  rescue_from Exception, with: :error500 # 後続の評価
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404 # 先頭の評価
  # Railsアプリケーション内で発生した例外のみを捕捉することができ、Rackミドルウェアで発生した例外処理については把捉できません。
  # デフォルトでは、public/***を表示する設定となっているのですが、独自でカスタマイズしたい場合は、`config/application.rb`で修正する必要があります。

  def error404
    render file: 'public/404.html', status: 404, layout: false
  end

  def error500(error)
    logger.error [error, *error.backtrace].join("\n")
    render file: Rails.public_path.join('500.html'), status: 500, layout: false
  end

  private

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    
    redirect_to root_path, alert: 'ログインしてください'
  end

  def current_user
    User.find(session[:user_id])
  end
end
