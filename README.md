
WReddit: Reddit API wrapper for Ruby
=======
# wreddit
A Reddit API Wrapper built in Ruby to play with my own Gem. It really only helps you grab subreddit information and user information.

##### What makes this special?
It's utilizing Reddit's free API resources. You can't make a lot of requests, but if you cache them using Redis, you could probably use this on a small toy app for yourself. It's a good way to quickly grab Reddit subreddits, comments, articles, and user profiles for your application. 

## Install
add this to your Gemfile:
```
gem 'wreddit'
```

run ```bundle install``` in your app

## How to use
###### Reserved Keywords
<b>User, Subreddit, Comments, Title, Parser</b>
<br>Yes, I realize that this would be inconvenient in a real-world application. This is simply my own project that taught me basic API wrapping skills. In the future, I will likely update everything including the lack of a Class to help OOP
###### Example of basic usage
```
    @reddit_user = user('username').parser
```
user    -> checks for a username on Reddit.com. If the user doesn't exist, their API handles that. 
parser  -> will parse the response in JSON format by default. If you'd like to parse XML or HTTP, you can do that like this:
```
...parser('xml') or parser('html')
```

###### Example of advanced usage
In this example, we'd be grabbing the subreddit, its comments in a specific thread
```
    @reddit_comment = subreddit('learnprogramming').comments('specific_article_id').parser
```
