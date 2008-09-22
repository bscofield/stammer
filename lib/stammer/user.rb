module Stammer
  module User
    def id
      self['id']
    end
    
    def name
      self['name']
    end
    
    def full_name
      self['full-name']
    end
  end
end