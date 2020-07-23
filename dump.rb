require 'find'

SRCPATH = "/Users/hfu/Downloads/東京駅周辺屋内地図オープンデータ（Shapefile）"
Find.find(SRCPATH) {|path|
  next unless /shp$/.match path
  sh
}

