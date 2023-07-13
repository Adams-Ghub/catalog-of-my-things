require_relative '../book'

describe 'Testing Book' do
  it 'Testing book data' do
    book = Book.new('hope', 'good', '2023-08-14')
    expect(book.publisher).to eq('hope')
    expect(book.cover_state).to eq('good')
    expect(book.publish_date).to eq('2023-08-14')
  end

  it 'Testing can_be_archived method' do
    book = Book.new('hope', 'bad', '2023-08-14')
    book1 = Book.new('hope', 'good', '2023-08-14')
    expect(book.can_be_archived?).to be true
    expect(book1.can_be_archived?).to be false
  end
end
