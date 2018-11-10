require 'nokogiri'
require 'fileutils'

fn = File.join(File.dirname(__FILE__), 'mirror', 'coops.tech.archived.website', 'index.html')
html = File.read(fn)
doc = Nokogiri::HTML(html)

doc.css('a.service-thumb').each do |node|
  url = node.xpath('@href').text
  service_slug = url.split('/')[1]

  style = node.xpath('div/@style')
  current_logo = style.text.match(/background-image: url\((.*)\)/)[1]
  current_logo.gsub!('%40', '@')
  service_name = node.xpath('h5').text

  p [service_name, service_slug, current_logo]

  current_logo_path = File.join(File.dirname(__FILE__), 'mirror', 'coops.tech.archived.website', current_logo)

  new_logo_path = File.join(File.dirname(__FILE__), '..', 'images', 'services', service_slug + File.extname(current_logo_path))

  FileUtils.cp(current_logo_path, new_logo_path)

  services_md_path = File.join(File.dirname(__FILE__), '..', '_services', service_slug + '.md')

  File.open(services_md_path, 'w') do |file|
    file.write("---\n")
    file.write("title: #{service_name}\n")
    file.write("name: #{service_name}\n")
    file.write("---\n")
  end
end

# File.open(output_fn, 'w') { |file| file.write(result) }
