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

def get_tables( html )
  output = []
  table_count = 0
  row_count = 0
  tables = html.scan( /\<table[^\>]*\>(.*?)\<\/table\>/i )
  tables.each() do |table|
    output[ table_count ] = []
    rows = table[0].scan( /\<tr[^\>]*\>(.*?)\<\/tr\>/i )
    rows.each() do |row|
      # data[:blocks].each() do |block|
      cell_text = []
      cells = row[0].scan( /\<t[d|h][^\>]*\>(.*?)\<\/t[d|h]\>/i )
      cells.each() do |cell|
        cell_text.push( clean_text( cell[0] ) )
      end
      # puts cells
      output[ table_count ][ row_count ] = cell_text
      row_count += 1
    end
    table_count += 1
  end
  return output
end

def get_lists( html )
  output = []
  list_count = 0
  lists = html.scan( /\<[u|o]l[^\>]*\>(.*?)\<\/[u|o]l\>/i )
  lists.each() do |list|
    rows = list[0].scan( /\<li[^\>]*\>(.*?)\<\/li\>/i )
    row_text = []
    rows.each() do |row|
      row_text.push( clean_text( row[0] ) )
    end
    output[ list_count ] = row_text
    list_count += 1
  end
  return output
end


# get html
url = "http://courses.wcupa.edu/jones/his101/web/t-roman.htm"
url = "https://en.wikipedia.org/wiki/16th_century"
path = 'data.html'
html = get_data( url, path, 'file' )

# strip out tabs and hard returns to prep file for processing
html = html.gsub( "\t", " " )
html = html.gsub( "\n", "" )

data = {}
data[:tables] = get_tables( html )
data[:lists] = get_lists( html )

puts data.to_json
