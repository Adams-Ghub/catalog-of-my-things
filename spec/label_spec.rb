require_relative '../classes/label'
require_relative '../classes/book'

describe 'Testing Label' do
  before :all do
    @label1 = Label.new('Hope', 'blue')
    @label2 = Label.new('Smile', 'Red')
    @label3 = Label.new('Purpose', 'Red')
  end

  it 'Testing book item' do
    book = Book.new('hope', 'good', '2023-08-14')
    book2 = Book.new('hope', 'good', '2023-08-14')
    @label1.add_item(book)
    @label1.add_item(book2)
    expect(book.label.title).to eq('Hope')
  end

  it 'Testing initial length' do
    expect(@label1.items.length).to eq(2)
  end

  it 'Add label' do
    expect(@label1.color).to eq('blue')
    expect(@label2.title).to eq('Smile')
    expect(@label3.color).to eq('Red')
  end
end
