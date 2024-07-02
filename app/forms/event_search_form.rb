class EventSearchForm
  # モジュール
  include ActiveModel::Model
  include ActiveModel::Attributes

  # アクセサ
  # attributeで定義することで、セッターとゲッターを生やすことができます。
  # started_atについては、日時変換が必要なので、定義していません。
  attribute :keyword, :string
  attribute :page, :integer

  # メソッド
  def search
    Event.search(
      keyword_for_search,
      where: { started_at: { gt: started_at } },
      page: page,
      per_page: 2
    )
  end

  def started_at
    @started_at || Time.current
  end

  def started_at=(new_started_at)
    @started_at = new_started_at.in_time_zone
  end

  private

  def keyword_for_search
    keyword.present? || "*"
  end
end
