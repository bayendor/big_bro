class BigBrother::Reader
  def self.lines_from_history_file(filename)
    File.readlines(filename).map(&:strip).reject(&:empty?)
  end
end
