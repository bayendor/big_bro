## CLI For Big Brother Command Line Tool

## Getting Started

This tool is the command line client for the `Big Brother` project that gathers shell command / tool usage patterns.

Go to the [Ministry of Truth Getting Started Page](https://ministry-of-truth.herokuapp.com/getting_started) and then login with your Github account.  It will take you to a customized "Getting Started" page that includes step by step instructions, along with a customized API key.

## Configuration

Downloading the Gem: `gem install big_bro`

Configure API Key: `big_bro config set api_key YOUR_API_KEY`

Push up your command line history with: `big_bro push`

The push defaults to `~/.bash_history`. If you use a different shell, it may save your history elsewhere.

You can tell Big Brother to use that location with:

`big_bro config set history_file /full/path/to/history`

We recommend pushing up your command history at least once a week.

## License
[Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/deed.en_GB).
