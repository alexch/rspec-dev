# Don't change this file. Configuration is done in config/environment.rb and config/environments/*.rb
unless defined?(RAILS_ROOT)
  root_path = File.join(File.dirname(__FILE__), '..')

  unless RUBY_PLATFORM =~ /mswin32/
    require 'pathname'
    root_path = Pathname.new(root_path).cleanpath(true).to_s
  end

  RAILS_ROOT = root_path
end

module Rails
  class << self
    def vendor_rails?
      true
    end
  end
end

ENV['RAILS_VERSION_FOR_RSPEC'] ||= "v2.3.2"
puts "running against rails #{ENV['RAILS_VERSION_FOR_RSPEC']}"

unless defined?(Rails::Initializer)
  
  version_root = File.expand_path("#{RAILS_ROOT}/vendor/rails")
  if File.directory?(version_root)
    $LOAD_PATH.unshift "#{version_root}/actionpack/lib/"
    $LOAD_PATH.unshift "#{version_root}/actionmailer/lib/"
    $LOAD_PATH.unshift "#{version_root}/actionwebservice/lib/"
    $LOAD_PATH.unshift "#{version_root}/activerecord/lib/"
    $LOAD_PATH.unshift "#{version_root}/activeresource/lib/"
    $LOAD_PATH.unshift "#{version_root}/activesupport/lib/"
    $LOAD_PATH.unshift "#{version_root}/railties/lib/"
    require "#{version_root}/railties/lib/initializer"
  end
end
