require 'net/http'
require 'fileutils'
require 'json'

def get_data( url, path, src )
  path_bak = 'bak_' + path
  if 'url' == src
    html = Net::HTTP.get( URI.parse( url ) )
    File.open( path, 'w' ) { | file | file.write( html ) }
    FileUtils.cp( path, path_bak )
  else
    html = File.read( path_bak )
  end
  return html
end

def clean_text( txt )
  txt = txt.gsub( /\<[^\>]+\>/i, "" )
  txt = txt.strip
end

# get html
url = "http://courses.wcupa.edu/jones/his101/web/t-roman.htm"
url = "https://en.wikipedia.org/wiki/16th_century"
path = 'data.html'
html = get_data( url, path, 'file' )

#get tables in html as delimited text
html = html.gsub( "\t", " " )
html = html.gsub( "\n", "" )

data = {}
data[:tables] = []
# data[:blocks] = html.scan( /\<table[^\>]*\>(.*?)\<\/table\>/i )
tables = html.scan( /\<table[^\>]*\>(.*?)\<\/table\>/i )

# puts blocks

table_count = 0
row_count = 0
tables.each() do |table|
  data[:tables][ table_count ] = {}
  data[:tables][ table_count ][ :rows ] = []
  rows = table[0].scan( /\<tr[^\>]*\>(.*?)\<\/tr\>/i )
  rows.each() do |row|
    # data[:blocks].each() do |block|
    cell_text = []
    cells = row[0].scan( /\<t[d|h][^\>]*\>(.*?)\<\/t[d|h]\>/i )
    cells.each() do |cell|
      cell_text.push( clean_text( cell[0] ) )
    end
    # puts cells
    data[:tables][ table_count ][ :rows ][ row_count ] = cell_text
    row_count += 1
  end
  table_count += 1
end
puts data.to_json

#
# # html = html.sub( /^.*?\<table[^\>]*\>/i, " " )
# # html = html.sub( /(.*)(\<\/table\>.*)/i, '\1' )
# # html = html.gsub( /\<\/table\>.*?\<table[^\>]*\>/i, "\n||||\n" )
# html = html.gsub( "<tr>", "\n" )
# html = html.gsub( /\<t[d|h][^\>]*\>/i, "\t" )
# # html = html.gsub( "</tr>", "\n" )
# html = html.gsub( /\<[^\>]+\>/i, "" )
# # html = html.gsub( "\n\n", "\n" )
# html = html.gsub( /\n\s+/i, "\n" )
#
# File.open( path, 'w' ) { | file | file.write( html ) }
# # puts html
#
# # exit
