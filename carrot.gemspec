# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{carrot}
  s.version = "0.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Amos Elliston"]
  s.date = %q{2009-10-19}
  s.description = %q{A synchronous version of the ruby amqp client}
  s.email = %q{amos@geni.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION.yml",
     "carrot.gemspec",
     "lib/amqp/buffer.rb",
     "lib/amqp/exchange.rb",
     "lib/amqp/frame.rb",
     "lib/amqp/header.rb",
     "lib/amqp/protocol.rb",
     "lib/amqp/queue.rb",
     "lib/amqp/server.rb",
     "lib/amqp/spec.rb",
     "lib/carrot.rb",
     "lib/examples/simple_pop.rb",
     "protocol/amqp-0.8.json",
     "protocol/amqp-0.8.xml",
     "protocol/codegen.rb",
     "protocol/doc.txt",
     "test/carrot_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/famoseagle/carrot}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A synchronous version of the ruby amqp client}
  s.test_files = [
    "test/carrot_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
