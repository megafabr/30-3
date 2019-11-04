require_relative 'lib/filler_things'
require_relative 'lib/things_collection'

# /XXX
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

  puts <<-HTML
    Хотите добавить в папку data новые вещи введите 1 
    если желаете совет о том, что сегодня надеть - 0
  HTML
  choice = STDIN.gets.to_i
loop do
  if choice == 1
    FillerThings.ask_and_write
    puts "Будите продолжать пополнять коллекцию одежды введите 1"
    if STDIN.gets.to_i == 1
      next
    else
      break
    end
  else
    puts "Сколько градусов за окном? (можно с минусом)"
    temp = STDIN.gets.to_i
    puts
    puts "Предлагаем сегодня надеть:"
    ThingsCollection.new.temp_range_collection
    things_for_temp = ThingsCollection.new.collection_for_temp(temp)
    puts things_for_temp
    puts
  end
    puts <<-HTML
    Искусственный интелект (Алиса) предполагает, 
    что этого набора не хватит чтобы выйти на улицу.
    Если согласны с Алисой введите 1 (вы сможете
    пополнить коллекцию вещей), для выхода 0
    HTML
    if STDIN.gets.to_i == 1
      choice = 1
      next
    else
      break
    end
end
