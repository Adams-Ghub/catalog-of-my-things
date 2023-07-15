require_relative '../classes/genre'
require_relative '../classes/item'

describe Author do
  before :all do
    @item = Item.new('2020-09-19')
    @genre = Genre.new('Jazz')
    @genre.add_item(@item)
  end

  it 'can be added to item class' do
    expect(@genre.items).to include(@item)
  end
end
