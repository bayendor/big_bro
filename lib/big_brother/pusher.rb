class BigBrother::Pusher
  def push
    json = BigBrother::Counter.count_commands_json
    url = "something"
    `curl -X PUT #{url} data=#{json}`
  end
end
