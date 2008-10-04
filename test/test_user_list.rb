require "#{File.dirname(__FILE__)}/test_helper"

class UserListTest < Test::Unit::TestCase
  def test_user_list_is_array
    m = Stammer::UserList.new([])
    assert m.is_a?(Array)
  end
  
  def test_userlist_elements_become_users
    m = Stammer::UserList.new({'users' => [{'id' => 1}]})
    assert m.first.is_a?(Stammer::User)
  end
end
