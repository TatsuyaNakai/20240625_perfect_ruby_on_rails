require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "created_by? owner_idとuser#idが同じ場合" do
    event = FactoryBot.create(:event)
    user = User.new
    user.stub(:id, event.owner_id) do
      assert_equal(true, event.created_by?(user))
    end
  end

  test "created_by? owner_idとuser#idが異なる場合" do
    event = FactoryBot.create(:event)
    user = FactoryBot.create(:user)
    assert_equal(false, event.created_by?(user))
  end

  test "created_by? 引数がnilの場合" do
    event = FactoryBot.create(:event)
    assert_equal(false, event.created_by?(nil))
  end
end
