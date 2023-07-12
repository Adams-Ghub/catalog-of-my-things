require './author'
require './item'


describe Author do
  before :all do
    @item = Item.new('2020-09-19')
    @author = Author.new('John', 'Stones')
    @author.add_item(@item)
  end

  it 'can be added to item class' do
    
    expect(@author.items).to include(@item)
  end
end
