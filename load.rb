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
