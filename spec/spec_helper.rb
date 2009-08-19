require File.dirname(__FILE__) + "/../../../../spec/spec_helper"
require File.dirname(__FILE__) + "/../init"

Spec::Runner.configure do |config|
  config.mock_with :mocha
end

def putsh(stuff)
  puts "#{ERB::Util.h(stuff)}<br/>"
end

def ph(stuff)
  putsh stuff.inspect
end
