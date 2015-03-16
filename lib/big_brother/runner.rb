require "optparse"

class BigBrother::Runner
  def self.run(cmd_line_args)
    BigBrother::Settings.load
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
    elsif args[0] == "config"
      config_commands(args)
    else
      puts "Big bro runner template"
    end
  end

  def self.config_commands(args)
    if args[1] == "get"
      return puts "needs a value to get" unless args[2]
      puts "#{args[2]} is \"\e[34m#{BigBrother::Settings.get(args[2])}\e[39m\""
    elsif args[1] == "set"
      return puts "needs a key and value to set" unless (args[2] && args[3])
      BigBrother::Settings.set(args[2], args[3])
      puts "#{args[2]} set to \"\e[34m#{args[3]}\e[39m\""
    else
      puts "Don't know how to use command #{args[1]}"
    end
  end
end
