require "#{File.dirname(__FILE__)}/test_helper"
require 'Time'

class MessageTest < Test::Unit::TestCase
  def setup
    @raw = {
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
    assert !@raw.respond_to?(:plain)
    setup_message
    assert @raw.respond_to?(:plain)
    assert_equal 'Hello world!', @raw.plain
  end

  def test_message_module_adds_sender_id_method
    assert !@raw.respond_to?(:sender_id)
    setup_message
    assert @raw.respond_to?(:sender_id)
    assert_equal 1, @raw.sender_id
  end

  def test_message_module_adds_sender_type_method
    assert !@raw.respond_to?(:sender_type)
    setup_message
    assert @raw.respond_to?(:sender_type)
    assert_equal 'user', @raw.sender_type
  end

  def test_message_module_adds_created_method
    assert !@raw.respond_to?(:created)
    setup_message
    assert @raw.respond_to?(:created)
    assert_equal Time.parse(@raw['created_at']), @raw.created
  end

  def test_message_module_overrides_id_method
    setup_message
    assert @raw.respond_to?(:id)
    assert_equal 1, @raw.id
  end
  
  private
  def setup_message
    @raw.extend(Stammer::Message)
  end
end
