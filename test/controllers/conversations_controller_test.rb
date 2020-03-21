require 'test_helper'
  BOT_ID = 55

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/conversations'
    assert_response :success
    assert_equal Conversation.all, assigns(:conversations)
    assert_equal Conversation.count, assigns(:conversations).length
  end

  test "should get conversation and conversations" do
    id = Conversation.first.id
    get '/conversations/' + id.to_s
    assert_response :success
    assert_equal Conversation.find(id), assigns(:conversation)
    assert_equal Conversation.all, assigns(:conversations)
    assert_equal Conversation.count, assigns(:conversations).length
  end

  test "raises RecordNotFound when not found" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get '/conversations/123'
    end
  end

end
