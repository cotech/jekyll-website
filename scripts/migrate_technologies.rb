require 'nokogiri'
require 'fileutils'

fn = File.join(File.dirname(__FILE__), 'mirror', 'coops.tech.archived.website', 'index.html')
html = File.read(fn)
doc = Nokogiri::HTML(html)

doc.css('a.technology-thumb').each do |node|
  url = node.xpath('@href').text
  technology_slug = url.split('/')[1]

  style = node.xpath('div/@style')
  current_logo = style.text.match(/background-image: url\((.*)\)/)[1]

  technology_name = node.xpath('h5').text

  p [technology_name, technology_slug, current_logo]

  current_logo_path = File.join(File.dirname(__FILE__), 'mirror', 'coops.tech.archived.website', current_logo)
  new_logo_path = File.join(File.dirname(__FILE__), '..', 'images', 'technologies', technology_slug + File.extname(current_logo_path))

  FileUtils.cp(current_logo_path, new_logo_path)

  technology_md_path = File.join(File.dirname(__FILE__), '..', '_technologies', technology_slug + '.md')

  File.open(technology_md_path, 'w') do |file|
    file.write("---\n")
    file.write("title: #{technology_name}\n")
    file.write("name: #{technology_name}\n")
    file.write("---\n")
  end
end

# File.open(output_fn, 'w') { |file| file.write(result) }
