#!/usr/bin/env ruby

# file: xmpp-agent.rb

require "xrc"
require 'app-routes'


class XMPPAgent
  include AppRoutes
  
  attr_reader :client
  
  def initialize(jid: '', password: '', port: 5222, host: nil, debug: false)
    
    @routes = {}; @params = {}; msg = nil  
    @debug = debug
    
    super()
    
    h = {
      jid: @jid = jid,
      password: password,
      port: port
    }
    
    h.merge!({hosts: [ host ]}) if host

    @client = client = Xrc::Client.new(h)
            
    @client.on_private_message do |x|

      messages(@params, client, x)
      
      begin
        run_route x.body.strip              
      rescue
        # ignore any problems for now
      end

    end            
    
    @client.on_connection_established do

      on_connected()

    end                
    
    @client.on_event do |e|

      if e.name.to_s == 'presence' then
        self.on_presence_update(show=e.text('show'), status=e.text('status'), 
                           user=e.attributes['from'] )
      end
      
    end
    
  end
            
  def connect()
    @client.connect
  end
  
  def say(body: '', from: @jid, to: '')
    @client.say(body: body, from: from, to: to, type: "chat")
  end
  
  protected
  
  def on_connected()
  end
  
  def on_presence_update(show, status, user)
  end  
  
  private
                        
  # note: msg contains attributes-> :from, to:, and :body
  def messages(params, client, msg)

    message %r{(send_to|send2)\s+([^\s]+)\s+(.*)} do

      user, msgout = params[:captures].values_at 1,2            

      client.say(body: msgout, from: @jid, to: user, type: "chat")            
    end

    message 'help' do
      msgout = 'available commands: help, send_to'
      client.reply(body: msgout, to: msg)            
    end

    message '.*' do

      msgout = 'need some help? type help'
      client.reply(body: msgout, to: msg)                        
    end

  end  
  
  def add_route(arg)
    get(arg) {yield(@params, @client, @msg)}
  end
  
  def message(route, &blk)
    get(route, &blk)
  end  

end 
