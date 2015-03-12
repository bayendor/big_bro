require "json"

class BigBrother::Counter
  IGNORED_COMMANDS = ["export"]

  def self.count_commands_json(file = BigBrother::HISTORY_FILE)
    count_commands(file).to_json
  end

  def self.count_commands(file = BigBrother::HISTORY_FILE)
    lines = BigBrother::Reader.lines_from_history_file(file)
    commands = normalize_commands(lines)
    commands = reject_ignored_commands(commands)
    commands.each_with_object({}) do |(command, argument), count_hash|
      count_hash[command] ||= {}
      count_hash[command][argument] ||= 0
      count_hash[command][argument] += 1
    end
  end

  def self.normalize_commands(commands)
    commands.map do |command|
      normalize_single_command command
    end
  end

  def self.reject_ignored_commands(commands)
    commands.reject do |cmd, _arg|
      IGNORED_COMMANDS.include? cmd.downcase
    end
  end

  def self.normalize_single_command(command)
    command, argument = reject_flags(command)[0..1]
    [command, argument || ""]
  end

  def self.reject_flags(command)
    command.split(" ").reject { |word| word[0] == "-" }
  end
end
