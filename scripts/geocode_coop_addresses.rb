require 'bundler/setup'
require 'yaml'
require 'geocoder'

Geocoder.configure(lookup: :nominatim)

root_path = Pathname.new(__dir__).join('..')

Dir[root_path.join('_coops/*.md')].each do |path|
  content = File.read(path)
  body = content.split("\n").reverse.take_while { |l| l != "---" }.reverse.join("\n")
  metadata = YAML.safe_load(content)

  address = metadata['address']
  latitude, longitude = Geocoder.coordinates(address, params: { region: 'uk' })
  metadata['latitude'] ||= latitude
  metadata['longitude'] ||= longitude

  frontmatter = YAML.dump(metadata)
  File.write(path, frontmatter + "---" + "\n" + body)
end
