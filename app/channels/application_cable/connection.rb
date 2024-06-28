module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # current_userのインスタンス変数を作成します。
    # 接続が確立された時に、チャネルでcurrent_userを使用できるようになります。
    identified_by :current_user

    # コンシューマーが接続を確立した時に呼び出されます。
    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed[:user_id])
        verified_user
      else
        # WebSocketでの接続を取りやめるためのメソッド
        reject_unauthorized_connection
      end
    end
  end
end
