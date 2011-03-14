#!/usr/bin/env ruby

# cssd.rb
# - extracting documentation from CSS files and converting to markdown
#
# - documentation text must be put on separate lines
# - example:
#   
#   /*
#   documentation line #1
#   documentation line #2
#   */
#
# - the documentation must use the Gruber markdown format: http://daringfireball.net/projects/markdown/syntax



require 'rdiscount'

unless ARGV.empty? 
  arg = ARGV[0]
  
  source = "#{arg}.css"
  if File.exists? source    
    dest = "#{arg}.html"
  
    ret = ''
    record = false
    File.open(source, 'r') do |f|
      f.each_line do |line|
        record = true if line.include? "/*"
        record = false if line.include? "*/"    
        next if (line.include? "/*") || (line.include? "*/")
        ret += line if record && line != ''                
      end
    end
    
    markdown = RDiscount.new(ret)
    File.open(dest, 'w') { |f| f.write(markdown.to_html) } 
    
    puts "#{dest} created sucessfuly."
  else
    puts "File does not exists: #{source}" 
  end
else
  puts "Generate documentation from CSS through Markdown into HTML." 
  puts " - Usage: cssd filename (without extension, .css is used automaticaly)"
  puts " - Input files are taken from current directory"
  puts " - Output files are put into current directory"
end
