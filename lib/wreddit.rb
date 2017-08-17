require 'json'
require 'nokogiri'
require 'httparty'


class Wreddit
  def initialize
    @uri = "https://www.reddit.com"
  end
  # standard requests
  def subreddit(subreddit_name = "all")
    @uri += "/r/#{subreddit_name}"
    self
  end

  def user(user_name)
    @uri += "/u/#{user_name}"
    self
  end

  def comments(article_id = nil)
    # gets all comments if article_id is unspecified
    @uri += "/comments"
    # add article_id if article is specified
    if article_id
      @uri += "/#{article_id}"
    end
    self
  end

  def title(title_name)
    @uri += "/#{title_name}"
    self
  end

  def comment(comment_id)
    @uri += "/#{comment_id}"
    self
  end

  # unique parsing (currently only works in JSON)
  def links
    links = []
    response = self.json
    if response.code == 200
      response['data']['children'].each do |child|
        links.push(child['data']['url'])
      end
      return links
    else
      return response
    end
  end

  def titles
    titles = []
    response = self.json
    if response.code == 200
      response['data']['children'].each do |child|
        titles.push(child['data']['title'])
      end
      return titles
    else
      return response
    end
  end

  def descriptions
    descriptions = []
    response = self.json
    if response.code == 200
      response['data']['children'].each do |child|
        descriptions.push(child['data']['selftext'])
      end
      return descriptions
    else
      return response
    end
  end

  # parse helpers
  def json
    HTTParty.get(URI(@uri + '.json'))
  end

  def xml
    HTTParty.get(URI(@uri + '.xml'))
  end

  def html
    HTTParty.get(URI(@uri))
  end

  # general parsing
  def parse(method = nil)
    # method of parsing your request
    case method
    when "json"
      self.json
    when "xml"
      self.xml
    when "html"
      self.html
    else
      # assume the user wants it in JSON format
      self.json
    end
  end
end
