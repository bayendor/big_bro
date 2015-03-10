class BigBrother::Runner
  def self.run(cmd_line_args, options)
    if options[:version]
      print_version
    else
      do_other_stuff
    end
  end

  def self.print_version
    puts BigBrother::VERSION
  end

  def self.do_other_stuff
    puts "Big bro runner template"
  end
end
