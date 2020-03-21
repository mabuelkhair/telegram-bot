require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/conversations'
    assert_response :success
    assert_equal Conversation.all, assigns(:conversations)
    assert_equal Conversation.count, assigns(:conversations).length
  end

end
