require_relative 'things_collection'
class Guide
  def self.advise
    ThingsCollection.create_collection
  end
end