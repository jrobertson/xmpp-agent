Gem::Specification.new do |s|
  s.name = 'xmpp-agent'
  s.version = '0.3.3'
  s.summary = 'Uses the Xrc gem to build a simple XMPP client.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/xmpp-agent.rb']
  s.add_runtime_dependency('xrc', '~> 0.1', '>= 0.1.8')
  s.add_runtime_dependency('app-routes', '~> 0.1', '>=0.1.19') 
  s.signing_key = '../privatekeys/xmpp-agent.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/xmpp-agent'
  s.required_ruby_version = '>= 2.1.2'
end
