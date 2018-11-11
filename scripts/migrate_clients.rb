require_relative 'coop'
require 'fileutils'

Coop.all.each do |coop|
  coop.clients.each do |client|
    current_logo_path = File.join(File.dirname(__FILE__), 'mirror', 'coops.tech.archived.website', 'co-op', client[:logo])
    new_logo_path = File.join(File.dirname(__FILE__), '..', 'images', 'clients', client[:slug] + File.extname(current_logo_path))

    FileUtils.cp(current_logo_path, new_logo_path)

    client_md_path = File.join(File.dirname(__FILE__), '..', '_clients', client[:slug] + '.md')

    File.open(client_md_path, 'w') do |file|
      file.write("---\n")
      file.write("title: #{client[:title]}\n")
      file.write("---\n")
    end
  end
end
