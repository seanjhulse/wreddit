require_relative 'wreddit'
reddit = Wreddit.new
puts reddit.subreddit('all').descriptions
