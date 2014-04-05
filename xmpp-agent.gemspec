Gem::Specification.new do |s|
  s.name = 'xmpp-agent'
  s.version = '0.2.2'
  s.summary = 'xmpp-agent'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_dependency('em-xmpp', '= 0.0.11')
  s.add_dependency('app-routes') 
  s.signing_key = '../privatekeys/xmpp-agent.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/xmpp-agent'
end
