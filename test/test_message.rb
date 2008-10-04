require "#{File.dirname(__FILE__)}/test_helper"
require 'time'

class MessageTest < Test::Unit::TestCase
  def setup
    @message = {
      'id' => 1,
      'sender-id' => 1,
      'sender-type' => 'user',
      'body' => {
        'plain' => 'Hello world!'
      },
      'created_at' => Time.now.to_s
    }
  end
  
  def test_message_module_adds_plain_method
    assert !@message.respond_to?(:plain)
    setup_message
    assert @message.respond_to?(:plain)
    assert_equal 'Hello world!', @message.plain
  end

  def test_message_module_adds_sender_id_method
    assert !@message.respond_to?(:sender_id)
    setup_message
    assert @message.respond_to?(:sender_id)
    assert_equal 1, @message.sender_id
  end

  def test_message_module_adds_sender_type_method
    assert !@message.respond_to?(:sender_type)
    setup_message
    assert @message.respond_to?(:sender_type)
    assert_equal 'user', @message.sender_type
  end

  def test_message_module_adds_created_method
    assert !@message.respond_to?(:created)
    setup_message
    assert @message.respond_to?(:created)
    assert_equal Time.parse(@message['created_at']), @message.created
  end

  def test_message_module_overrides_id_method
    setup_message
    assert @message.respond_to?(:id)
    assert_equal 1, @message.id
  end
  
  private
  def setup_message
    @message.extend(Stammer::Message)
  end
end
