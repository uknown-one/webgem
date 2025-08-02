require "optparse"

module Webgem
  class CLI
    def self.start(argv = ARGV)
      options = {}
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: webgem [command] [options]"

        opts.on("-o", "--output FILE", "Write generated HTML to FILE") do |f|
          options[:output] = f
        end

        opts.on("-t", "--theme THEME", "Theme name (e.g., dark)") do |t|
          options[:theme] = t
        end

        opts.on("-h", "--help", "Print help") do
          puts opts
          exit
        end
      end

      parser.parse!(argv)

      # Example: generate a sample page
      renderer = Renderer.new
      renderer.theme(options[:theme]) if options[:theme]
      renderer.component "div", class: "page" do
        component "h1" do
          text "Welcome to WebGem"
        end
        component "p" do
          text "This is a sample generated page using webgem."
        end
      end

      html = renderer.to_html
      if options[:output]
        File.write(options[:output], html)
        puts "Written to #{options[:output]}"
      else
        puts html
      end
    end
  end
end
