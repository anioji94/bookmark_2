require_relative './../app.rb'
require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| "#{bookmark['title']}: #{bookmark['url']}" }
  end

  def self.create(new_url, new_title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{new_url}', '#{new_title}')")
  end
end
