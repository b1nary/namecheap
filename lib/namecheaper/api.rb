require 'active_support/core_ext/string/inflections'

class Namecheaper
  class Api
    SANDBOX = 'https://api.sandbox.namecheap.com/xml.response'
    PRODUCTION = 'https://api.namecheap.com/xml.response'
    ENVIRONMENT = defined?(Rails) && Rails.respond_to?(:env) ? Rails.env : (ENV["RACK_ENV"] || 'development')

    def initialize parent
      @parent = parent
    end

    def endpoint
      return PRODUCTION if @parent.config[:force_production]
      (ENVIRONMENT == 'production' ? PRODUCTION : SANDBOX)
    end

    def get(command, options = {})
      request 'get', command, options
    end

    def post(command, options = {})
      request 'post', command, options
    end

    def put(command, options = {})
      request 'post', command, options
    end

    def delete(command, options = {})
      request 'post', command, options
    end

    def request(method, command, options = {})
      command = 'namecheap.' + command
      options = init_args.merge(options).merge({:command => command})
      options.keys.each do |key|
        options[key.to_s.camelize] = options.delete(key)
      end

      case method
      when 'get'
        #raise options.inspect
        HTTParty.get(endpoint, { :query => options})
      when 'post'
        HTTParty.post(endpoint, { :query => options})
      when 'put'
        HTTParty.put(endpoint, { :query => options})
      when 'delete'
        HTTParty.delete(endpoint, { :query => options})
      end
    end

    def init_args
      options = {
        api_user:  @parent.config[:username],
        user_name: @parent.config[:username],
        api_key:   @parent.config[:key],
        client_ip: @parent.config[:client_ip] || '127.0.0.1'
      }
      p options
    end
  end
end
