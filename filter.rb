require 'json'
type = ENV['TYPE']
maxzoom = ENV['MAXZOOM']

while gets
  f = JSON.parse($_.strip)
  minzoom = case type
    when 'Floor'
      13
    else
      17
  end
  f["tippecanoe"] = {
    :minzoom => minzoom, :maxzoom => maxzoom, :layer => type.downcase
  }
  print "\x1e#{JSON.dump(f)}\n"
end
