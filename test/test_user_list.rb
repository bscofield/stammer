require "#{File.dirname(__FILE__)}/test_helper"

class UserListTest < Test::Unit::TestCase
  def test_user_list_is_array
    m = Stammer::UserList.new([])
    assert m.is_a?(Array)
  end

end
