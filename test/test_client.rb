require "#{File.dirname(__FILE__)}/test_helper"

class ClientTest < Test::Unit::TestCase
  def test_new_creates_a_client
    assert_nothing_raised do
      Stammer::Client.new('a', 'b')
    end
  end
  
  def test_new_errors_on_incomplete_client_credentials
    assert_raises(Stammer::InvalidCredentials) do
      Stammer::Client.new('a', 'b', 'a')
    end
  end
  
  private
  def setup_client
    client = Stammer::Client.new('a@a.com', 'b')
    client
  end
end