require "#{File.dirname(__FILE__)}/test_helper"

class TagListTest < Test::Unit::TestCase
  def test_tag_list_is_array
    m = Stammer::TagList.new([])
    assert m.is_a?(Array)
  end

end
