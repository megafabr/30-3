class FillerThings
  def self.ask_and_write
    # создаем новые элементы
    puts "Начинаем ввод данных новой вещи"
    print "Введите название вещи (к примеру Кроссовки):"
    clothes_name = STDIN.gets.chomp

    print "Введите тип вещи (к примеру Обувь):"
    clothes_type = STDIN.gets.chomp

    print "Введите нижний диапазон температуры для ношения этого вида одежды (можно с минусом):"
    temp_range_low = STDIN.gets.to_i
    if temp_range_low >= 0
      temp_range_low = "+#{temp_range_low}"
    else
      temp_range_low = "-#{temp_range_low.abs}"
    end

    print "Введите верхний диапазон температуры для ношения этого вида одежды (можно с минусом):"
    temp_range_high = STDIN.gets.to_i
    if temp_range_high >= 0
      temp_range_high = "+#{temp_range_high}"
    else
      temp_range_high = "-#{temp_range_high.abs}"
    end
    temp_range = "(#{temp_range_low}, #{temp_range_high})"

    # считываем из папки data txt файлы
    things_files = Dir[__dir__ + '/../data/*.txt']
    new_number = things_files.size + 1

    # создаем новый файл для добавляемой вещи под номером new_number
    file_name = File.dirname(__FILE__ ) + "/../data/#{new_number}.txt"

    # записываем три строчки
    [clothes_name, clothes_type, temp_range].map do |item|
      file = File.new(file_name, "a:UTF-8")
      file.print("#{item}\n")
      file.close
    end
  end
end