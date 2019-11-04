class ThingsCollection
  def initialize
    @things_collection = nil
    # @temp_range_collection = nil
    # puts @things_collection
  end

  def create_collection
    # считаем все файлы коллекции и замепим их массив из хэшей
    @things_collection = Dir[__dir__ + '/../data/*.txt'].map do |file_name|
      f = File.new(file_name, "r:UTF-8").readlines
      temp_range_low = f[2].gsub(/[()]/, '').split(', ')[0].to_i
      temp_range_high = f[2].gsub(/[()]/, '').split(', ')[1].to_i
      {
        :clothes_name => f[0].chomp,
        :clothes_type => f[1].chomp,
        :temp_range_low => temp_range_low,
        :temp_range_high => temp_range_high
      }
    end
  end

  def temp_range_collection
    @things_collection.map { |thing| [thing[:temp_range_low], thing[:temp_range_high]] }
  end
end