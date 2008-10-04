require "#{File.dirname(__FILE__)}/test_helper"

class TagListTest < Test::Unit::TestCase
  def test_tag_list_is_array
    m = Stammer::TagList.new([])
    assert m.is_a?(Array)
  end
  
  def test_taglist_elements_become_tags
    m = Stammer::TagList.new({'tags' => [{'id' => 1}]})
    assert m.first.is_a?(Stammer::Tag)
  end
end
