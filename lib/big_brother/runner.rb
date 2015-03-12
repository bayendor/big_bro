require "optparse"

class BigBrother::Runner
  def self.run(cmd_line_args)
    options = parse_options
    help_message = options[:help_message]
    if options[:version]
      print_version
    elsif options[:help] || cmd_line_args.empty? || cmd_line_args[0] == "help"
      puts help_message
    else
      parse_cmd_line_args(cmd_line_args)
    end
  end

  def self.parse_options
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: big-bro [options]"

      opts.on("-v", "--version", "Show version") do
        options[:version] = true
      end

      opts.on("-h", "--help", "Show help") do
        options[:help] = true
      end
      options[:help_message] = opts.to_s
    end.parse!
    options
  end

  def self.print_version
    puts BigBrother::VERSION
  end

  def self.parse_cmd_line_args(args)
    if args[0] == "json"
      puts BigBrother::Counter.count_commands_json
    else
      puts "Big bro runner template"
    end
  end
end
