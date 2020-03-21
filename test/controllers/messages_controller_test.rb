require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get error missing param" do
    assert_raises(ActionController::ParameterMissing) do
      post '/messages'
    end
  end
  # test "should get work" do
  #   post '/messages', params: { message: "new message", conversation_id: "id" }
  # end

end
