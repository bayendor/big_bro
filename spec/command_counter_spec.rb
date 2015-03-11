require_relative "spec_helper"

RSpec.describe "BigBrother counter" do
  it "counts from a file with nested hashes for 2nd arguments" do
    file_path = File.expand_path "../test_data/counter_test.txt", __FILE__
    json = BigBrother::Counter.count_commands_json(file_path)
    counted_commands = JSON.parse(json)
    expect(counted_commands["git"]["init"]).to eq(4)
    expect(counted_commands["git"]["status"]).to eq(3)
    expect(counted_commands["git"][""]).to eq(1)
    expect(counted_commands["something_else"][""]).to eq(5)
  end
end
