# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ajax_select_tag/version'

Gem::Specification.new do |spec|
  spec.name          = "ajax_select_tag"
  spec.version       = AjaxSelectTag::VERSION
  spec.authors       = ["onodera"]
  spec.email         = ["s1160054@gmail.com"]

  spec.summary       = %q{親子関係のあるセレクトボックスをつくる}
  spec.description   = %q{親子関係のある複数のセレクトボックスを、ajaxで動的にオプションを変更する}
  spec.homepage      = "http://s1160054.github.io/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://github.com/s1160054/ajax_select_tag"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
