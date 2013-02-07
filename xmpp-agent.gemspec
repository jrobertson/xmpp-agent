Gem::Specification.new do |s|
  s.name = 'xmpp-agent'
  s.version = '0.1.8'
  s.summary = 'xmpp-agent'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_dependency('xmpp4r')
  s.add_dependency('app-routes') 
  s.signing_key = '../privatekeys/xmpp-agent.pem'
  s.cert_chain  = ['gem-public_cert.pem']
end
