require_relative 'wreddit'
puts "Hello world"

reddit = Wreddit.new
puts reddit.subreddit('learnprogramming').parse('xml')
