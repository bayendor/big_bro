require "json"

class BigBrother::Settings
  def self.settings_file
    @settings_file || File.expand_path("~/.big_brother.json")
  end

  def self.settings_file=(path)
    @settings_file = path
  end

  def self.defaults
    {
      "history_file" => File.expand_path("~/.bash_history"),
      "push_url" => "https://ministry-of-truth.herokuapp.com/",
      "api_key" => nil
    }
  end

  def self.load
    touch settings_file
    @settings = defaults.merge(JSON.parse(File.read(settings_file)))
    save
  end

  def self.get(setting)
    @settings[setting]
  end

  def self.set(setting, value)
    @settings[setting] = value
    save
  end

  def self.save
    File.write(settings_file, @settings.to_json)
  end

  def self.touch(file_name)
    File.write(file_name, "{}") unless File.exists? file_name
  end
end
