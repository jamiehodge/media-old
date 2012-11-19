# -*- encoding: utf-8 -*-

require File.expand_path("../lib/media/version", __FILE__)

Gem::Specification.new do |gem|
  gem.author          = ["jamiehodge"]
  gem.email           = ["jamieh@hum.ku.dk"]
  gem.description     = "Media Service"
  gem.summary         = "Media Service"
  gem.homepage        = ""

  gem.files           = `git ls-files`.split($\)
  gem.executables     = gem.files.grep(%r{^bin/}).map {|f| File.basename(f) }
  gem.test_files      = gem.files.grep(%r{^test/})
  gem.name            = "media"
  gem.require_paths   = ["lib"]
  gem.version         = Media::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest"

  gem.add_dependency  "sequel"
  gem.add_dependency  "pg"

  gem.add_dependency  "ku-ldap"
  gem.add_dependency  "dalli"

  gem.add_dependency  "nokogiri"
  gem.add_dependency  "pony"
  gem.add_dependency  "queue_classic"
end
