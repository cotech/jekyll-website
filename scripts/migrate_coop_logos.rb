require_relative 'coop'
require 'fileutils'

base_dir = File.join(File.dirname(__FILE__), 'mirror', 'coops.tech.archived.website', 'co-op')
Coop.all.each do |coop|
  current_fn = File.join(base_dir, coop.logo)
  ext = File.extname(current_fn)
  new_fn = File.join(File.dirname(__FILE__), '..', 'images', 'coops', coop.slug + ext)

  FileUtils.cp(current_fn, new_fn)
end
