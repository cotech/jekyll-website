require_relative 'coop'
require 'erb'

Coop.all.each do |coop|
  output_fn = File.join(File.dirname(__FILE__), '..', '_coops', coop.slug + '.md')

  renderer = ERB.new(File.read('coop.erb.md'), nil, '<>')
  result = renderer.result(coop.erb_binding)
  File.open(output_fn, 'w') { |file| file.write(result) }
end
