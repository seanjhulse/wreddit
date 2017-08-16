require "wreddit/version"
require 'net/http'
require 'json'
require 'nokogiri'

module Wreddit
  def subreddit(subreddit_name)
    @uri = "https://www.reddit.com/r/#{subreddit_name}"
    self
  end
  def user(user_name)
    @uri = "https://www.reddit.com/user/#{user_name}"
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
  def parser(method = nil)
    # method of parsing your request
    case method
    when "json"
      JSON.parse(Net::HTTP.get(URI(@uri + '.json')))
    when "xml"
      Nokogiri::XML(Net::HTTP.get(URI(@uri + '.xml')))
    when "html"
      Nokogiri::HTML(Net::HTTP.get(URI(@uri)))
    else
      # assume the user wants it in JSON format
      JSON.parse(Net::HTTP.get(URI(@uri + '.json')))
    end
  end
end
