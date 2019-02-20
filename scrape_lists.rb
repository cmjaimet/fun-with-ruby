require 'net/http'
require 'fileutils'
# require 'json'

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


# get html
url = "http://courses.wcupa.edu/jones/his101/web/t-roman.htm"
url = "https://en.wikipedia.org/wiki/16th_century"
path = 'data.html'
html = get_data( url, path, 'url' )

#get tables in html as delimited text
html = html.gsub( "\t", " " )
html = html.gsub( "\n", "" )
html = html.sub( /^.*?\<[u|o]l[^\>]*\>/i, " " )
html = html.sub( /(.*)(\<\/[u|o]l\>.*)/i, '\1' )
html = html.gsub( /\<\/[u|o]l\>.*?\<[u|o]l[^\>]*\>/i, "\n||||\n" )
html = html.gsub( "<li>", "\n" )
# html = html.gsub( /\<t[d|h][^\>]*\>/i, "\t" )
html = html.gsub( /\<[^\>]+\>/i, "" )
html = html.gsub( /\n\s+/i, "\n" )

File.open( path, 'w' ) { | file | file.write( html ) }
# puts html

# exit
# tables = html.scan( /\<table[^\>]*\>(.*?)\<\/table\>/i )
#
# puts tables
