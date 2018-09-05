require 'httparty'
require 'pp'
require 'namecheaper/version'
require 'namecheaper/api'
require 'namecheaper/config'
require 'namecheaper/domains'
require 'namecheaper/dns'
require 'namecheaper/ns'
require 'namecheaper/ssl'
require 'namecheaper/transfers'
require 'namecheaper/users'
require 'namecheaper/whois_guard'

class Namecheaper
  attr_accessor :configure

  def initialize(config = {})
    @configure = {client_ip: '127.0.0.1'}.merge(config)
  end

  def config; @configure; end

  def domains;    @domains ||= Namecheaper::Domains.new(self); end
  def dns;        @dns ||= Namecheaper::Dns.new(self); end
  def ns;         @ns ||= Namecheaper::Ns.new(self); end
  def transfers;  @transfers ||= Namecheaper::Transfers.new(self); end
  def ssl;        @ssl ||= Namecheaper::Ssl.new(self); end
  def users;      @users ||= Namecheaper::Users.new(self); end
  def whois_guard;@whois_guard ||= Namecheaper::WhoisGuard.new(self); end
end
