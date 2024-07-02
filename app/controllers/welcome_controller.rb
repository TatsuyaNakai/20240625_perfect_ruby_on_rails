class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    # ElasticSearchを使用する場合には、導入した場合のパフォーマンスを考えて導入した方が良いかもしれません。
    # データ数が少ない場合は、導入しない方がパフォーマンス的に優れている可能性があります。
    @event_search_form = EventSearchForm.new(event_search_form_params)
    @events = @event_search_form.search
  end

  private

  def event_search_form_params
    permit_params = params.fetch(:event_search_form, {}).permit(:keyword, :started_at)
    permit_params.merge(page: params[:page])
  end
end
