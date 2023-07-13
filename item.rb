class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived, :genre

  def initialize(publish_date, archived: false)
    @id = Random.rand(0..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def move_to_archive()
    return unless can_be_archived?

    @archived = true
  end

  def genre=(genre)
    @genre=genre
    genre.items.push(self) unless genre.items.include?(self)

  end

  private

  def can_be_archived?()
    @publish_date > 10
  end
end
