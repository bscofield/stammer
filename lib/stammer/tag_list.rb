module Stammer
  class TagList < Array
    def initialize(list)
      if list.is_a?(Hash)
        processed_list = list['tags'].map do |m|
          m.extend(Tag)
        end
      else
        processed_list = list
      end
      super(processed_list)
    end
  end
end