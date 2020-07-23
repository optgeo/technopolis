require 'find'

SRCPATH = "/Users/hfu/Downloads/東京駅周辺屋内地図オープンデータ（Shapefile）"
TYPES = ["Drawing", "Facility", "Floor", "Opening", "Space", "Fixture", "Segment", "Line", "Point", "link", "node"]
MAXZOOM = 17

desc 'produce tiles'
task :tiles do
  cmd = []
  TYPES.each {|type|
    r = []
    Find.find(SRCPATH) {|path|
      next unless /#{type}\.shp$/.match path
      r << "ogr2ogr -f GeoJSONSeq /vsistdout/ #{path} "
    }
    cmd << "((#{r.join('; ')}) | TYPE=#{type} MAXZOOM=#{MAXZOOM} ruby filter.rb )"
  }
  sh "(#{cmd.join('; ')}) | tippecanoe -o tiles.mbtiles -f --maximum-zoom=#{MAXZOOM} --base-zoom=#{MAXZOOM} --hilbert"
  sh "tile-join --force --no-tile-compression --output-to-directory=docs/zxy --no-tile-size-limit tiles.mbtiles"
end

desc 'create style.json'
task :style do
  sh "parse-hocon conf/style.conf > docs/style.json"
  sh "gl-style-validate docs/style.json"
end

desc 'host the site locally'
task :host do
  sh "budo -d docs"
end

