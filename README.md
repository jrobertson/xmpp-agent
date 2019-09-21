# Using Xmpp-Agent

## Usage

    require 'xmpp-agent'


    xmpp = XMPPAgent.new(jid: 'jeeves_mobile@jamesrobertson.eu', password: 'secret')
    def xmpp.on_connected()
      puts 'yay'
    end

    def xmpp.on_presence_update(show, status, user)
      puts "user %s %s %s" % [user, show, status]
    end

    xmpp.connect

## Resources

* xmpp-agent https://rubygems.org/gems/xmpp-agent

xmpp xrc bot jabber
