require 'net/http'
require "net/https"
require 'uri'

class WelcomeController < ApplicationController
  layout 'application'

  def index

  end
  
  def authsub
    client = GData::Client::Photos.new
    next_url = 'http://127.0.0.1:3000/welcome/authsub_callback'
    secure = false  # set secure = true for signed AuthSub requests
    sess = true
    authsub_link = client.authsub_url(next_url, secure, sess)
    redirect_to authsub_link
  end

  def authsub_callback
    client = GData::Client::Photos.new
    client.authsub_token = params[:token]
    session[:token] = client.auth_handler.upgrade()
    client.authsub_token = session[:token] if session[:token]
  end

  def list_albums
    client = GData::Client::Photos.new
    client.authsub_token = session[:token] if session[:token]

    feed = client.get('http://picasaweb.google.com/data/feed/api/user/dermotbrennan').to_xml
    #feed = client.get('http://picasaweb.google.com/data/feed/api/user/dermotbrennan/albumid/5484232918636202257').to_xml

    logger.debug feed.to_s.inspect

    feed.elements.each('entry') do |entry|
      logger.debug 'title: ' + entry.elements['title'].text
      logger.debug 'updated: ' + entry.elements['updated'].text
      logger.debug 'id: ' + entry.elements['id'].text

      # Extract the href value from each <atom:link>
#      links = {}
#      entry.elements.each('link') do |link|
#        links[link.attribute('rel').value] = link.attribute('href').value
#      end
#      puts links.to_s
    end
  end

end
