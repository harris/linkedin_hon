# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Backend::Application.initialize!

$client = LinkedIn::Client.new('921smhk051xk', '0r4kB7ouRfzBQhWm')
require "execjs"

