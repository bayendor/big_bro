# Notes for the future

### Running big_bro in development

```sh
big_bro config set push_url http://localhost:3000
```

### Deploying the gem

BE SURE TO BUMP THE VERSION FIRST

```sh
gem build .gemspec
gem push big_bro-VERSION.gem
```

The gem will automatically build every file under `lib/big_brother`
but be sure to require it in the `lib/big_brother.rb` so it works correctly with the command line tool.

### Code overview

The `big_bro` command starts the `BigBrother::Runner` with `.run`,
so any new commands need to be added there and call your new files.

The `Pusher` is how big_bro talks to the Rails Big Brother.
This currently is through uploading the JSON as a file with a PUT request.

The `Counter` is a little confusing but it is what takes in
the history file and outputs a counted hash of the commands.
The best way to understand this piece is probably by looking
through the `spec/command_counter_spec.rb`.

Last thing to see if the `Settings`.
Everything for big_bro is configured at `~/.big_brother.json`,
which is used for things like your api key. Fairly straightforward.
