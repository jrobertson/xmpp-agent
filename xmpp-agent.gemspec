Gem::Specification.new do |s|
  s.name = 'xmpp-agent'
  s.version = '0.1.2'
  s.summary = 'xmpp-agent'
  s.files = Dir['lib/**/*.rb']
  s.add_dependency('xmpp4r')
  s.add_dependency('app-routes')
end
