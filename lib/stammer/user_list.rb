module Stammer
  class UserList < Array
    def initialize(list)
      if list.is_a?(Hash)
        processed_list = list['users'].map do |m|
          m.extend(User)
        end
      else
        processed_list = list
      end
      super(processed_list)
    end
  end
end