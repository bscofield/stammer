module Stammer
  module Message
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