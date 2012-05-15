#Introducing the XMPP Agent gem

The XMPP Agent gem is a wrapper for xmpp4r-simple suitable for building xmpp bots. In the example below an XMPP bot responds to the commands 'hello' and 'say'.

The main features of this gem are:  

1. Error handling.  If the xmpp connection is lost a retry will be attempted repeatedly

2. Routes. XMMP messages can be read without fuss and the code maintained more easily with routes.


    require 'xmpp-agent'

    class Bot < XMPPAgent

      def initialize()
        super()
        @user = 'jeeves@rorbuilder.info'
        @password = 'secretpassword'
      end

      def messages(params, messenger, msg)

        message 'hello' do
          messenger.deliver(msg.from, "hello you")
        end

        message %r{say (.*)} do |messagex|
          messenger.deliver(msg.from, messagex)
        end

        super(params, messenger, msg)
      end

      def run
        super(@user, @password)
      end
      
    end

    Bot.new.run

    =begin
    output:

    james: how are you?
    jeeves@rorbuilder.info: need some help? type help

    james: hello
    jeeves@rorbuilder.info: hello you

    james: say how are you?
    jeeves@rorbuilder.info: how are you?
    =end

## Notes

* To use this gem you will need a valid XMPP account.
* xmppr4-simple is included with the gem and is compatible with Ruby1.9 upwards.
