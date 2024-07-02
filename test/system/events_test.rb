require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  test "visiting the show" do
    event = FactoryBot.create(:event)
    visit event_url(event)
  
    assert_selector "h1", text: event.name
  end

  test "visiting the new" do
    user = FactoryBot.create(:user)
    sign_in_as(user)

    visit new_event_url
    assert_selector "h1", text: "イベント作成"
  end

  test "creating the new event" do
    user = FactoryBot.create(:user)
    sign_in_as(user)

    visit new_event_url

    fill_in "名前", with: "TokyuRubyKaigi"
    fill_in "場所", with: "東京"
    fill_in "内容", with: "tokyu.rbによる地域Ruby会議"

    started_at = Time.current
    ended_at = started_at + 3.hours

    started_at_field = "event_started_at"
    select started_at.strftime("%Y"), from: "#{started_at_field}_1i" # 年
    select I18n.l(started_at, format: '%B'), from: "#{started_at_field}_2i" # 月
    select started_at.strftime("%-d"), from: "#{started_at_field}_3i" # 日
    select started_at.strftime("%H"), from: "#{started_at_field}_4i" # 時
    select started_at.strftime("%M"), from: "#{started_at_field}_5i" # 分

    ended_at_field = "event_ended_at"
    select ended_at.strftime("%Y"), from: "#{ended_at_field}_1i" # 年
    select I18n.l(ended_at, format: '%B'), from: "#{ended_at_field}_2i" # 月
    select ended_at.strftime("%-d"), from: "#{ended_at_field}_3i" # 日
    select ended_at.strftime("%H"), from: "#{ended_at_field}_4i" # 時
    select ended_at.strftime("%M"), from: "#{ended_at_field}_5i" # 分

    click_on "登録する"

    assert_selector "div.alert", text: "イベントを作成しました"
  end

  test "destroying the event" do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    event = FactoryBot.create(:event, owner: current_user)

    visit event_url(event)

    assert_difference("Event.count", -1) do
      accept_confirm do
        click_on 'イベントを削除する'
      end
      assert_selector "div.alert", text: "イベントを削除しました"
    end
  end
end
