module Webgem
  module Grid
    # Simplified responsive grid generator using utility classes.
    def self.container(&block)
      comp = Component.new("div", class: "max-w-screen-xl mx-auto px-4", &block)
      comp
    end

    def self.row(&block)
      Component.new("div", class: "flex flex-wrap -mx-2", &block)
    end

    def self.col(size = 1, &block)
      width = (size.to_f / 12 * 100).to_s.sub(/\.0+$/, '') # percentage
      Component.new("div", { style: "flex: 0 0 #{width}%; max-width: #{width}%; padding: 0 0.5rem;" }, &block)
    end
  end
end
