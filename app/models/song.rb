# require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    # binding.pry
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes=(content)
    # binding.pry
    content.each do |n|
      self.notes << Note.create(content: n)
    end
  end
end
