class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    Song.count{|song| song.genre == self}
  end

  def artist_count
    Song.count{|song| song.artist if song.genre == self}
  end

  def all_artist_names
    Song.all.map{|song| song.artist.name}
  end
end
