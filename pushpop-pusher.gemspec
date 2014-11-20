# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'pushpop-pusher/version'

Gem::Specification.new do |s|

  s.name        = "pushpop-pusher"
  s.version     = Pushpop::Pusher::VERSION
  s.authors     = ["Phil Leggetter"]
  s.email       = "phil@pusher.com"
  s.homepage    = "https://github.com/pushpop-project/pushpop-pusher"
  s.summary     = "Pushpop Pusher plugin for triggering events and distributing them to listening clients"

  s.add_dependency "pushpop"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
