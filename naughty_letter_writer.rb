require 'erb'

kids_data   = File.read('data/kids-data.txt')
nice_letter = File.read('templates/nice_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split # split makes each kid an array with strings inside.

  name        = kid_data_array[0]
  gender      = kid_data_array[1]
  behavior    = kid_data_array[2]
  infraction  = kid_data_array[15]
  toy_recieved  = kid_data_array[3..8].sample

  toys_not_recieving = []

  kid_data_array[3..8].each do |toy|
    if toy != toy_recieved
      toys_not_recieving >> toy
    end
    puts toys_not_recieving
  end

  next unless behavior == 'nice'

  filename    = 'letters/nice/' + name + '.txt'
  letter_text = ERB.new(nice_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
