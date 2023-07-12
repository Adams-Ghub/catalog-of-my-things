class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(0..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive()
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?()
    @publish_date > 10
  end
end
