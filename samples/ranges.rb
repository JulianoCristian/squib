#!/usr/bin/env ruby
require 'squib'

data = {'name' => ['Thief', 'Grifter', 'Mastermind'], 
        'type' => ['Thug', 'Thinker', 'Thinker'],
        'level' => [1,2,3]}

Squib::Deck.new(width: 825, height: 1125, cards: 3) do
  # Default range is :all
  background color: :white
  rect x: 15, y: 15, width: 795, height: 1095, x_radius: 50, y_radius: 50
  rect x: 30, y: 30, width: 128, height: 128, x_radius: 25, y_radius: 25
  text str: data['name'], x: 250, y: 55, font: 'Arial 54'
  text str: data['level'], x: 65, y: 40, font: 'Arial 72'

  # Could be explicit about using :all, too
  text range: :all, str: data['type'], x: 50, y: 128, font: 'Arial 18'

  # Ranges are inclusive
  text range: 0..1, str: "Thief and Grifter only!!", x: 25, y:200

  # We can use Arrays too!
  text range: [0,2], str: "Thief and Mastermind only!!", x: 25, y:300

  # Useful idiom: construct a hash from card names back to id,
  # then use a range. No need to memorize IDs, and you can add cards easily
  id = {} ; data['name'].each_with_index{ |name,i| id[name] = i}
  text range: id['Thief']..id['Grifter'], 
       str: "Thief through Grifter with id lookup!!",  
       x:25, y: 400

  # Useful idiom: generate arrays from a column called 'type'
  type = {}; data['type'].each_with_index{ |t,i| (type[t] ||= []) << i}
  text range: type['Thinker'], 
       str: "Only for Thinkers!",  
       x:25, y: 500
       
  save prefix: 'ranges_', format: :png
end

puts "Done!"