require "#{File.dirname(__FILE__)}/test_helper"

class MessageListTest < Test::Unit::TestCase
  def test_message_list_is_array
    m = Stammer::MessageList.new([])
    assert m.is_a?(Array)
  end
  
  def test_messagelist_elements_become_messages
    m = Stammer::MessageList.new({'messages' => [{'id' => 1}]})
    assert m.first.is_a?(Stammer::Message)
  end
end
