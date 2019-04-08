require 'json'
puts "SPELLS EE TEE ELL"

class SpellEtl

  # def data_path = path
  #   @data_path = path
  # end

  def file_list
    @file_list = []
  end

  def initialize( path )
    @data_path = path
    @file_list = get_file_list()
    @spells_full = get_all()
  end

  def get_all()
    spells = {}
    @file_list.each() do | file_path |
      class_name = file_path.scan( /.*\/([a-z]+)\.csv/i )[0][0]
      rows = get_csv( '', file_path )
      rows.each() do |row|
        cells = row.split( "\t" )
        name = cells.shift
        if spells.has_key? name
          spells[ name ][ :classes ].push( class_name )
        else
          level = cells[0].strip.downcase
          if 'cantrip' == level
            level = 0
          else
            level = level.scan( /([1-9]).*/i )[0][0].to_i
          end
          spells[ name ] = {
            level: level,
            school: cells[1],
            ritual: "yes" == cells[2] ? true : false,
            casting_time: cells[3],
            components: cells[4],
            concentration: "yes" == cells[5] ? true : false,
            classes: [ class_name ]
          }
        end
      end
      # puts file_path
      # puts spells
    end
    return spells
  end

  def get_csv( file_name, file_path = '' )
    file_path = '' != file_path ? file_path : @data_path + file_name
    File.read( file_path ).split( "\n" )
  end

  def get_all_spells()
    return @spells_full.to_json
  end

  def get_file_list()
    if ! @file_list.nil?
      return @file_list
    end
    Dir[ @data_path + '*.csv' ]
  end

  def csv_to_json( csv )
  end

  def tyemp( csv )
    # Name   ◇	Level   ◇	School   ◇	Ritual   ◇	Casting Time   ◇	Components   ◇	Concentration   ◇	Source   ◇
    spell_list = []
    spell_input = File.read( '../data/spells/all.csv' )
    lines = spell_input.split( "\n" )
    idx = 0
    lines.each() do |line|
      elems = line.split( "\t" )
      spell = [
        id: idx,
        name: elems[0],
        level: elems[1].gsub( /[a-z]/, '' ).to_i,
        school: elems[2],
        ritual: 'yes' == elems[3] ? true : false,
        cast_time: elems[4],
        components: elems[5],
        concentration: 'yes' == elems[6] ? true : false
      ]
      spell_list.push( spell )
      idx += 1
    end

    spells_json= JSON.generate( spell_list )

    spell_output = File.open( '../data/spells/all.json', 'w' )
    spell_output.write( spells_json )
    spell_output.close


    newspells = File.read( '../data/spells/all.json' )
    count = 0
    JSON.parse( newspells ).each() do |linenew|

      if 3 == count
        puts linenew
      end
      count += 1
    end
  end

end

etl = SpellEtl.new( '../data/spells/' )
# puts etl.get_csv( 'paladin.csv' )
# puts etl.get_file_list( )
# puts etl.file_list
spells = etl.get_all_spells()
File.open( '../data/all_spells.json', 'w' ) { | file | file.write( spells ) }
