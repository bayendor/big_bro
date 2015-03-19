require_relative "lib/big_brother/version"

Gem::Specification.new do |s|
  s.name        = 'big_bro'
  s.version     = BigBrother::VERSION
  s.licenses    = ['MIT']
  s.summary     = "CLI hook to Big Brother"
  s.description = "Pushes data from your terminal history up to the Ministry of Truth"
  s.authors     = ["dalexj", "vikiann", "bayendor"]
  s.email       = '96dalex@gmail.com'
  s.add_runtime_dependency "faraday", '~> 0.9'
  s.files       = ["lib/big_brother.rb"] + Dir["lib/big_brother/*"]
  s.homepage    = 'https://github.com/bayendor/big_bro'
  s.executables << 'big_bro'
end
