require 'bundler/setup'
require 'yaml'

root_path = Pathname.new(__dir__).join('..')

Dir[root_path.join('_coops/*.md')].each do |path|
  content = File.read(path)
  body = content.split("\n").reverse.take_while { |l| l != "---" }.reverse.join("\n")
  metadata = YAML.safe_load(content)
  frontmatter = YAML.dump(metadata)
  File.write(path, frontmatter + "---" + "\n" + body)
end
