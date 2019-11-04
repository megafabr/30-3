class ThingsCollection
  def initialize
    @things_collection = Dir[__dir__ + '/../data/*.txt'].map do |file_name|
      f = File.new(file_name, "r:UTF-8").readlines
      {
        :clothes_name => f[0].chomp,
        :clothes_type => f[1].chomp,
        :temp_range_low => f[2].gsub(/[()]/, '').split(', ')[0].to_i,
        :temp_range_high => f[2].gsub(/[()]/, '').split(', ')[1].to_i
      }
    end
  end

  def temp_range_collection
    @things_collection.map do
    |thing| [thing[:temp_range_low], thing[:temp_range_high]]
    end
  end

  def collection_for_temp(temp)
    @things_collection.map.with_index do |thing, index|
      temp_range = temp_range_collection[index]
      if temp > temp_range[0] && temp < temp_range[1]
        "#{thing[:clothes_name]}" +
        " (#{thing[:clothes_type]})" +
        " #{thing[:temp_range_low]}..#{thing[:temp_range_high]}"
      end
    end
  end
end