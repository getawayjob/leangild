require 'active_support/core_ext'

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch 'config/application.rb'
  watch 'config/environment.rb'
  watch %r{^config/environments/.*\.rb$}
  watch %r{^config/initializers/.*\.rb$}
  watch 'config/routes.rb'
  watch 'Gemfile'
  watch 'Gemfile.lock'
  watch 'spec/factories.rb'
  watch 'spec/spec_helper.rb'
  watch %r{^spec/support/.*\.rb$}
  watch 'config/locales/.*'
end


