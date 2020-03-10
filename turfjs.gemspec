# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'turfjs'
  s.version = '0.0.3'
  s.summary = 'Ruby TurfJS is a bridge to JavaScript library Turf.js'
  s.description =
    'Turf.js is an advanced geospatial analasis library for GeoJSON data.'
  s.authors = ['Michael Yin']
  s.email = 'layerssss@gmail.com'
  s.files = Dir['lib/*.rb', 'lib/turfjs-build.js']
  s.homepage = 'https://github.com/layerssss/turfjs-ruby'
  s.license = 'MIT'
  s.add_runtime_dependency 'execjs', '~> 2.2', '>= 2.2.1'
  s.add_runtime_dependency 'activesupport'
end
