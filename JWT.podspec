Pod::Spec.new do |s|
  s.name         = 'JWT'
  s.version      = '1.1.0'
  s.summary      = 'A JSON Web Token implementation in Objective-C.'
  s.homepage     = 'http://github.com/alexdeleon/JWT'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Klaas Pieter Annema' => 'klaaspieter@annema.me' }
  s.author       = { 'Alexander De Leon' => 'me@alexdeleon.name' }
  s.source       = { :git => 'https://github.com/alexdeleon/JWT.git', :tag => 'v1.1.0' }
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'
  s.source_files = 'JWT/**/*.{h,m}'
  s.requires_arc = true
end
