
WReddit: Reddit API wrapper for Ruby
=======
# wreddit
A Reddit API Wrapper built in Ruby to play with my own Gem. It really only helps you grab subreddit information and user information.

##### What makes this special?
It's utilizing Reddit's free API resources. That means you don't need any authorization to make requests. You can't make a lot of requests, but if you cache them using Redis, you could probably use this on a small toy app for yourself. It's a good way to quickly grab Reddit subreddits, comments, articles, and user profiles for your application.

## Install
add this to your Gemfile:
```
gem 'wreddit'
```

run ```bundle install``` in your app

## How to use
As of v.1.0.2 we are using the Wreddit class.
###### Example of basic usage
```
    wreddit = Wreddit.new #wreddit will be a standard variable for future examples
    @reddit_user = wreddit.user('username').parse
```
<b>user</b>      -> checks for a username on Reddit.com. If the user doesn't exist, their API handles that.<br>
<b>subreddit</b> -> checks for subreddit. If left empty, it'll default to /r/all.<br>
<b>parse</b>     -> will parse the response in JSON format by default. If you'd like to parse XML or HTTP, you can do that like this:
```
...parse('xml') or parse('html') or parse('json')
```

###### Example of advanced usage
In this example, we'd be grabbing the subreddit and its comments in a specific thread
```
    @reddit_comments = wreddit.subreddit('learnprogramming').comments('specific_article_id').parse
```
Getting top links to articles in subreddit
```
    @reddit_links = wreddit.subreddit('learnprogramming').links
```
Getting top titles of articles in subreddit
```
    @reddit_titles  = wreddit.subreddit('learnprogramming').titles
```
Getting top descriptions of articles in subreddit
```
    @reddit_descriptions = wreddit.subreddit('learnprogramming').descriptions
```

##### Hazards
You cannot assume that any of these methods together will provide some response. Logically, some of these will render nil arrays. However, you'd be surprised by some things you can do. Like:
In this example, we'd be grabbing the subreddit, its comments in a specific thread
```
    @stuff = wreddit.user('myusername').links #provides valid links to user submitted threads

    @stuff = wreddit.user('myusername').descriptions #provides valid descriptions to commments
```

But you would <b>NOT</b> be able to write something like:
```
    @invalid_response = wreddit.user('myusername').subreddit('learnprogramming').parse
```

The API will response with 404.

Email me with any questions at seanjhulse@gmail.com
