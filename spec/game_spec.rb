require_relative 'game'

describe Game do
  before :all do
    @game1 = Game.new('2014-09-07', true, '2022-08-07')
    @game2 = Game.new('2010-08-03', false, '2023-06-07')
    @game3 = Game.new('2016-09-07', false, '2019-05-09')
    @game4 = Game.new('2012-10-07', true, '2018-08-09')
  end

  context 'cannot be archived if' do
    it 'published date < 10 years and last played date is < 2 years' do
      expect(@game1.can_be_archived?).to be false
    end

    it 'published date > 10 years but last played date < 2 years' do
      expect(@game2.can_be_archived?).to be false
    end
    it 'published date < 10 years but last played date is > 2 years' do
      expect(@game3.can_be_archived?).to be false
    end
  end

  context 'can be archived if' do
    it 'published date > 10 years and last played date is > 2 years' do
      expect(@game4.can_be_archived?).to be true
    end
  end
end
