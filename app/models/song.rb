class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def genre_name 
    self.genre ? self.genre.name : nil
  end 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name 
    self.artist ? self.artist.name : nil
  end 

  def note_contents=(content)
    content.each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

  def note_contents
    a = []
    self.notes.each do |note|
      a << note.content unless note.content.empty?
    end
    a
  end
end
