#!/usr/bin/env ruby

# file: xmpp-agent.rb

require 'xmpp4r-simple'
require 'app-routes'

class XMPPAgent
  include AppRoutes

  def initialize()        
    @route = {}; @params = {}
  end

  def run(user, password)

    begin
      xmpp_connect(user, password)
    rescue
      puts ($!).to_s
      sleep 5
      retry
    end
  end

  def messages(params, messenger, msg)

    message %r{(send_to|send2)\s+([^\s]+)\s+(.*)} do
      user, message = params[:captures].values_at 1,2
      messenger.deliver(user, message)
    end

    message 'help' do
      messenger.deliver(msg.from, "available commands: help, send_to")
    end

    message '*' do
      messenger.deliver(msg.from, "need some help? type help")
    end

  end

  def xmpp_connect(user, password)

    puts "connecting to jabber server.."  
    messenger = Jabber::Simple.new(user,password)  
    puts "connected."  

    while true
      messenger.received_messages do |msg|  
        routes(@params, messenger, msg)
        run_route msg.body.strip
      end  
      sleep 1
    end
  end

  def message(route, &blk)
    get(route, &blk)
  end
end
