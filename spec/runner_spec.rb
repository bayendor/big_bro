require_relative "spec_helper"

RSpec.describe "BigBrother::Runner" do
  it "prints out help for `big_bro help`" do
    fake_output = StringIO.new
    BigBrother::Runner.set_output_stream(fake_output)
    BigBrother::Runner.run(["help"])
    expect(fake_output.string).to include("Usage")

    fake_output = StringIO.new
    BigBrother::Runner.set_output_stream(fake_output)
    BigBrother::Runner.run([], {help: true})
    expect(fake_output.string).to include("Usage")
  end

  it "prints the version" do
    fake_output = StringIO.new
    BigBrother::Runner.set_output_stream(fake_output)
    BigBrother::Runner.run([], { version: true })
    expect(fake_output.string).to include(BigBrother::VERSION)
  end

  it "gets a config variable" do
    fake_output = StringIO.new
    BigBrother::Runner.set_output_stream(fake_output)
    BigBrother::Settings.set("test_key", "test_value")
    BigBrother::Runner.run %w[config get test_key]
    expect(fake_output.string).to include("test_value")
  end

  it "sets a config variable" do
    fake_output = StringIO.new
    BigBrother::Runner.set_output_stream(fake_output)
    BigBrother::Settings.set("test_key", "test_value")
    BigBrother::Runner.run %w[config set test_key test_value2]
    expect(BigBrother::Settings.get("test_key")).to include("test_value2")
  end

  it "prints out errors" do
    fake_output = StringIO.new
    BigBrother::Runner.set_output_stream(fake_output)
    BigBrother::Settings.set("test_key", "test_value")
    BigBrother::Runner.run %w[config blah]
    expect(fake_output.string).to include("Don't know how")
    expect(fake_output.string).to include("blah")
  end
end
