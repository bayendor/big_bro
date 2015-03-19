require "faraday"
require "tmpdir"

class BigBrother::Pusher
  def self.temp_path
    File.expand_path "big_bro.json", Dir.tmpdir
  end

  def self.push
    json = BigBrother::Counter.count_commands_json
    File.write temp_path, json
    conn = Faraday.new(BigBrother::Settings.get("push_url")) do |f|
      f.request :multipart
      f.request :url_encoded
      f.adapter :net_http
    end

    payload = { file: Faraday::UploadIO.new(temp_path, "text/plain") }

    conn.put("/api/users", payload)
  end
end
