# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "huginn_transport_opendata"
  spec.version       = '0.1'
  spec.authors       = ["Shanmathuran Sritharan"]
  spec.email         = ["shanmathuran.sritharan@stud.uni-due.de"]

  spec.summary       = "Huginn agent to connects to Swiss public transport API transport.opendata.ch ."

  spec.homepage      = "https://github.com/shan9204/huginn_transport_opendata"

  spec.license       = "MIT"


  spec.files         = Dir['LICENSE.txt', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir['spec/**/*.rb'].reject { |f| f[%r{^spec/huginn}] }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "huginn_agent"
  spec.add_runtime_dependency "transprt", "~> 0.2.2"
end
