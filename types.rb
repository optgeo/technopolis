require 'find'

SRCPATH = "/Users/hfu/Downloads/東京駅周辺屋内地図オープンデータ（Shapefile）"
types = []
Find.find(SRCPATH) {|path|
  next unless /shp$/.match path
  type = File.basename(path, ".shp").split("_")[-1]
  types << type
}
types.uniq!
p types
