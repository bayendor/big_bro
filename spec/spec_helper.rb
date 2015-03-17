require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/bin/"
end
require_relative "../lib/big_brother"
test_settings = File.expand_path "../test.json", __FILE__
BigBrother::Settings.settings_file = File.expand_path "../test.json", __FILE__
