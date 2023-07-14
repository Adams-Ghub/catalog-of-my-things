module PreserveData
  def save_all_data
    save_authors_games
  end

  def load_all_data
    load_authors_games
  end

  private

  def save_authors_games
    file_path = 'Data/authors.json'
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
    File.write('Data/authors.json', JSON.pretty_generate(updated_data))
  end

  def load_authors_games
    return unless File.exist?('Data/authors.json')

    json_authors = JSON.parse(File.read('Data/authors.json'))

    json_authors.each do |author|
      new_author = Author.new(author['author'][0]['first name'], author['author'][0]['last name'])
      new_game = Game.new(author['items'][0]['published_date'], author['items'][0]['multiplayer'],
                          author['items'][0]['last_played_at'])
      new_author.add_item(new_game)

      @authors << new_author
      @games << new_game
    end
  end
end
