module Stammer
  module Message
    def id
      self['id']
    end
    
    def sender_id
      self['sender-id']
    end
    
    def sender_type
      self['sender-type']
    end
    
    def ytb?
      !(self.plain =~ /^(today|blocker|yesterday)/).nil?
    end

    def plain
      self['body']['plain']
    end

    def created
      Time.parse(self['created_at'])
    end
  end
end