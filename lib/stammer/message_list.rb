module Stammer
  class MessageList < Array
    def initialize(list)
      if list.is_a?(Hash)
        processed_list = list['messages'].map do |m|
          m.extend(Message)
        end
      else
        processed_list = list
      end
      super(processed_list)
      @newest = processed_list.first
      @oldest = processed_list.last
    end

    def yesterday(ytbs = false)
      @yesterday ||= extract_yesterdays(ytbs)
    end

    def today(ytbs = true)
      @today ||= extract_todays(ytbs)
    end

    def by_ytbs
      @by_ytbs ||= group_by_ytbs
    end

    def by_tags
      @by_tags ||= group_by_tags
    end

    private
    def for_day(start_of_day = Time.today, ytbs = true)
      end_of_day = start_of_day + (24*60*60)
      messages = self.entries.select do |m|
        m.created >= start_of_day && m.created < end_of_day && ((m.ytb? && ytbs) || (!m.ytb? && !ytbs))
      end
      MessageList.new(messages)
    end

    def extract_yesterdays(ytbs)
      yday = Time.today - (24*60*60)
      for_day(yday, ytbs)
    end

    def extract_todays(ytbs)
      for_day(Time.today, ytbs)
    end

    def group_by_ytbs
      self.entries.select { |m|
        m.ytb?
        }.inject({:yesterday => [], :today => [], :blockers => []}) do |hash, m|
          hash[:yesterday] << m if m.plain =~ /^yesterday/
          hash[:today] << m if m.plain =~ /^today/
          hash[:blockers] << m if m.plain =~ /^blocker/

          hash
        end
      end

      def group_by_tags
        tagged = self.entries.inject({}) do |hash, m|
          m.plain.scan(/#\S+/).each do |tag|
          hash[tag] ||= []
          hash[tag] << m
        end

        hash
      end
      tagged.delete('')
      tagged
    end
  end
end