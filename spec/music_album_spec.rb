require 'date'
require_relative '../classes/item'
require_relative '../classes/music_album'

describe 'Game' do
  before :all do
    @my_music = MusicAlbum.new('2016-09-07', true)
    @music = MusicAlbum.new('2010-08-03', false)
    @musical = MusicAlbum.new('2009-09-07', true)
  end

  context 'cannot be archived if' do
    it 'if parent\'s method returns true AND if on_spotify equals true' do
      expect(@my_music.can_be_archived?).to be false
    end
    it 'if parent\'s method returns true AND if on_spotify equals true' do
      expect(@music.can_be_archived?).to be false
    end
  end

  context 'can be archived if' do
    it 'if parent\'s method returns true AND if on_spotify equals true' do
      expect(@musical.can_be_archived?).to be true
    end
  end
end
