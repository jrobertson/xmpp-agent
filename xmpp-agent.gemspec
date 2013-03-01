Gem::Specification.new do |s|
  s.name = 'xmpp-agent'
  s.version = '0.2.0'
  s.summary = 'xmpp-agent'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_dependency('em-xmpp')
  s.add_dependency('app-routes') 
  s.signing_key = '../privatekeys/xmpp-agent.pem'
  s.cert_chain  = ['gem-public_cert.pem']
end
