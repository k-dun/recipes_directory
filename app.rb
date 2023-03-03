require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, name, time_required, rating FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  puts "#{record["id"]}. #{record["name"]} recipe." 
  puts "Time required: #{record["time_required"]} minutes."
  puts "Rating: #{record["rating"]}/5"
  puts ""
end