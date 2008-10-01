require 'rubygems'
require 'json'
require 'net/https'

module Stammer
  class Client
    
    ACCEPTABLE_SUBSETS = [:all, :sent, :received, :following]
    FORMAT = 'json'
    HEADERS = {'User-Agent' => 'Stammer v0.0.3', 'Accept' => "text/#{FORMAT}"}
    API_URL = "https://yammer.com/api/v1"
    
    def initialize(user, password, secret = nil, client = nil)
      @user     = user
      @password = password
    
      unless !secret || !client
        @secret = secret
        @client = client
      else
        raise Stammer::InvalidCredentials if secret != client
      end
    end
    
    # TODO: pagination via older_than/newer_than
    def messages(subset = :all)
      raise ArgumentError.new("Subset must be in [#{ACCEPTABLE_SUBSETS.join(', ')}]") unless ACCEPTABLE_SUBSETS.include?(subset)
      subset = nil if subset == :all
      MessageList.new(send_request('messages', subset.to_s))
    end
    
    # TODO: pagination via page
    def users(id = nil)
      UserList.new(send_request('users', id))
    end
    
    def tags(id = nil)
      TagList.new(send_request('tags', id))
    end
        
    def update_status(status)
      raise ArgumentError.new("must update with a status") if status.to_s == ""
      url = URI.parse(API_URL + "/messages")
      conn = create_connection(url)
      res = conn.start do |http|
        req = Net::HTTP::Post.new(url.path, HEADERS)
        req.basic_auth(@user, @password)
        req.form_data = {'body' => status}
        http.request(req)
      end
      return res.is_a?(Net::HTTPCreated)
    end

    private
    
    def send_request(*args)
      url = URI.parse("#{API_URL}/#{args.compact.join('/')}.#{FORMAT}")
      puts "grabbing #{url.to_s}"
      conn = create_connection(url)
      res = conn.start do |http| 
        req = Net::HTTP::Get.new(url.path, HEADERS)
        req.basic_auth(@user, @password)
        http.request(req)
      end
      JSON.load(res.body)
    end
    
    def create_connection(url)
      conn = Net::HTTP.new(url.host, url.port)
      conn.use_ssl = true
      conn.verify_mode = OpenSSL::SSL::VERIFY_NONE
      conn
    end
  end
end