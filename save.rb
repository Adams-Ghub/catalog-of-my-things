def save_books
  updated_books = []

  @books.each do |book|
    updated_books << { publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date }
    File.write('json/books.json', JSON.pretty_generate(updated_books))
  end
end

def save_label
  updated_labels = []
  @labels.each do |label|
    updated_labels << { title: label.title, color: label.color }
    File.write('json/labels.json', JSON.pretty_generate(updated_labels))
  end
end


def save_authors_games
  file_path = 'json/authors.json'
  if File.exist?(file_path)
    JSON.parse(File.read(file_path))
  else
    []
  end

  updated_data = @authors.map do |author|
    related_items = author.items.map do |author_item|
      { publish_date: author_item.publish_date,
        multiplayer: author_item.multiplayer,
        last_played_at: author_item.last_played_at }
    end
    author_arr = [{ 'first name': author.first_name, 'last name': author.last_name }]
    { id: author.id, author: author_arr, items: related_items }
  end
  File.write('json/authors.json', JSON.pretty_generate(updated_data))
end