class BigBrother::Pusher
  def self.push
    json = BigBrother::Counter.count_commands_json
    url  = "http://localhost:3000/api/users"
    `curl -X PUT --data big_bro='#{json}' #{url}`
  end
end
