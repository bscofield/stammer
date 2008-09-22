require 'rubygems'
require 'json'
require 'net/https'

module Stammer
  class Client
    def initialize(user, password, secret = nil, client = nil, format = 'json')
      @user     = user
      @password = password
      @format   = format

      unless !secret || !client
        @secret = secret
        @client = client
      else
        raise Stammer::InvalidCredentials if secret != client
      end
    end
    
    # TODO: pagination via older_than/newer_than
    def messages(subset = nil)
      MessageList.new(send_request('messages', subset))
    end
    
    # TODO: pagination via page
    def users(id = nil)
      UserList.new(send_request('users', id))
    end
    
    def tags(id = nil)
      TagList.new(send_request('tags', id))
    end

    private
    def send_request(*args)
      url = URI.parse("https://yammer.com/api/v1/#{args.compact.join('/')}.#{@format}")
      
      conn = Net::HTTP.new(url.host, url.port)
      conn.use_ssl = true
      conn.verify_mode = OpenSSL::SSL::VERIFY_NONE
      res = conn.start { |http| 
        req = Net::HTTP::Get.new(url.path, {'User-Agent' => 'Stammer v0.0.1', 'Accept' => 'text/json'})
        req.basic_auth(@user, @password)
        http.request(req)
      }
      JSON.load(res.body)
    end
  end
end