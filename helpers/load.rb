def load_books
  if File.exist?('json/books.json')
    json_books = JSON.parse(File.read('json/books.json'))
  else
    json_books = []
    File.write('json/books.json', json_books.to_json)
  end

  json_books.each do |book|
    @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
  end
end

def load_labels
  if File.exist?('json/labels.json')
    json_labels = JSON.parse(File.read('json/labels.json'))
  else
    json_labels = []
    File.write('json/labels.json', json_labels.to_json)
  end

  json_labels.each do |label|
    @labels << Label.new(label['title'], label['color'])
  end
end

def load_authors_games
  return unless File.exist?('json/games.json')

  json_authors = JSON.parse(File.read('json/games.json'))

  json_authors.each do |author|
    new_author = Author.new(author['author'][0]['first name'], author['author'][0]['last name'])
    new_game = Game.new(author['items'][0]['publish_date'], author['items'][0]['multiplayer'],
                        author['items'][0]['last_played_at'])
    new_author.add_item(new_game)

    @authors << new_author
    @games << new_game
  end
end

def load_music_albums
  return unless File.exist?('./json/music_albums.json')

  json_albums = JSON.parse(File.read('./json/music_albums.json'))

  json_albums.each do |album|
    new_genre = Genre.new(album['genre'])
    new_album = MusicAlbum.new(album['items'][0]['publish date'], album['items'][0]['on spotify'])
    new_genre.add_item(new_album)

    @genres << new_genre
    @music_albums << new_album
  end
end
