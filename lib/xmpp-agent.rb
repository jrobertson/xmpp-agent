#!/usr/bin/env ruby

# file: xmpp-agent.rb

require 'em-xmpp'
require 'app-routes'

class XMPPAgent
  include AppRoutes
  
  def initialize()
    @routes = {}; @params = {}; @conn = nil; @ctx = nil    
    super()    
  end
  
  def received(conn,ctx)

    @conn = conn
    @ctx = ctx
    messages(@params, @conn, @ctx)
    run_route ctx.body.strip   
  end

  def messages(params, conn, ctx)

    message %r{(send_to|send2)\s+([^\s]+)\s+(.*)} do

      user, message = params[:captures].values_at 1,2
      data = conn.message_stanza('to' => user) {|xml| xml.body(message) }       
      conn.send_stanza data
    end

    message 'help' do
      data = conn.message_stanza('to' => ctx.from) do |xml| 
          xml.body('available commands: help, send_to')
      end      
      conn.send_stanza data
    end

    message '.*' do

      data = conn.message_stanza('to' => ctx.from) do |xml| 
          xml.body('need some help? type help')
      end            
      conn.send_stanza data
    end

  end  
  
  def add_route(arg)
    get(arg) {yield(@params, @conn, @ctx)}
  end
  
  def message(route, &blk)
    get(route, &blk)
  end
  
  def conn() @conn end
  
  def presence_update(ctx)
  end

end 
