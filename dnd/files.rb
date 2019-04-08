# Rename files in a directory
Dir['../data/spells/*.json'].each do |file|
  File.rename( file, file.sub( 'json', 'csv' ) )
end

# open a file to read
data = File.read( '../data/spells/all.csv' )
lines = data.split( "\n" )
lines.each() do |line|
  puts line
end
