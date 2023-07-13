class MusicAlbum < Item

  attr_accessor :name, :on_spotify, :genre, :publish_date

  def initialize(name, publish_date, genre, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
    @name = name
    @genre = genre
  end

  def can_be_archived?
    super && on_spotify==true
  end
end