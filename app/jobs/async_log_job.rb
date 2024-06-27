class AsyncLogJob < ApplicationJob
  queue_as :hoge

  # 処理したい内容を記載します。
  def perform(msg: 'hello')
    AsyncLog.create!(message: msg)
  end
end
