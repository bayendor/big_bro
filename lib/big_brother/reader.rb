class BigBrother::Reader
  HISTORY_FILE = File.expand_path("~/.bash_history")

  def self.lines_from_history_file(filename = HISTORY_FILE)
    File.readlines(filename).map(&:strip).reject(&:empty?)
  end
end
