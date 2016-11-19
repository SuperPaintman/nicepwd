require "../nicepwd"

nicepwd = Nicepwd::Formatter.new

if !STDIN.tty?
  # From pipe
  while str = STDIN.gets
    puts nicepwd.format str
  end
elsif !ARGV.empty?
  # From args
  ARGV.each do |arg|
    puts nicepwd.format arg
  end
else
  # Current dir
  puts nicepwd.format Dir.current
end
