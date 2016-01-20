require 'smarter_csv'

def load_data(filename)
  SmarterCSV.process("./data/#{filename}.csv")
end

def top_five_by_quantity(collection, column)
  
  grouped = collection.group_by{ |incident| incident[column] }
  grouped.keys.compact.map{ |key| [key, grouped[key].length] }
              .sort_by{ |pair| pair[1] }
              .reverse
              .first(5)
end

traffic = load_data('traffic-accidents')
crime = load_data('crime')

puts top_five_by_quantity(traffic, :incident_address)
puts top_five_by_quantity(traffic, :neighborhood_id)
puts top_five_by_quantity(crime, :neighborhood_id)