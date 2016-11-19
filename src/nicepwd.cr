require "./nicepwd/version"

module Nicepwd
  class Formatter
    def initialize(@home = ENV["HOME"])
      @home_regex = Regex.new("^#{@home}")
    end

    def format(pwd)
      pwd = pwd.gsub(@home_regex, "~")
      pwd = pwd.gsub /\/([^\/]+)(?=\/)/ do |name|
        "/#{name[1]}"
      end
      pwd
    end
  end
end
