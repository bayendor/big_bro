require_relative "spec_helper"

RSpec.describe "file reader" do
  it "gives all lines of the file" do
    file_path = File.expand_path "../test_data/read_test.txt", __FILE__
    lines = BigBrother::Reader.lines_from_history_file(file_path)
    expect(lines.length).to eq(3)
    expect(lines).to include("some words")
    expect(lines).to include("some more words")
    expect(lines).to include("qwerty")
  end
end
