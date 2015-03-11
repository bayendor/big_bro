require_relative "../lib/big_brother"
require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/bin/"
end
