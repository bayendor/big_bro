require "json"

class BigBrother::Settings
  SETTINGS_FILE = File.expand_path("~/.big_brother.json")

  def self.defaults
    {
      "history_file" => File.expand_path("~/.bash_history"),
      "api_key" => nil
    }
  end

  def self.load
    touch SETTINGS_FILE
    @settings = defaults.merge(JSON.parse(File.read(SETTINGS_FILE)))
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
    File.write(SETTINGS_FILE, @settings.to_json)
  end

  def self.touch(file_name)
    File.write(file_name, "{}") unless File.exists? file_name
  end
end
