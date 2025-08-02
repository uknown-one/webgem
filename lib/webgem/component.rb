module Webgem
  class Component
    attr_reader :name, :attributes, :children, :content

    def initialize(name, attributes = {}, &block)
      @name = name.to_s
      @attributes = attributes.transform_keys(&:to_s)
      @children = []
      @content = nil
      instance_eval(&block) if block_given?
    end

    # DSL inside a component for nested components
    def component(name, attrs = {}, &block)
      child = Component.new(name, attrs, &block)
      add(child)
      child
    end

    def add(child)
      @children << child
    end

    def text(string)
      @content = string
    end

    def to_html
      attr_string = @attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
      inner = if @children.any?
                @children.map { |c| c.to_html }.join
              elsif @content
                @content
              else
                ""
              end
      if void_element?
        "<#{@name} #{attr_string.strip}/>"
      else
        "<#{@name} #{attr_string.strip}>#{inner}</#{@name}>"
      end
    end

    def void_element?
      %w[img br hr input meta link].include?(@name)
    end
  end

  # Shortcut for declaring components in a DSL style
  class Renderer
    def initialize
      @root_children = []
      @theme = Theme.default
    end

    def component(name, attrs = {}, &block)
      comp = Component.new(name, attrs, &block)
      @root_children << comp
      comp
    end

    def theme(name_or_hash = nil)
      if name_or_hash.is_a?(String) || name_or_hash.is_a?(Symbol)
        @theme = Theme.load(name_or_hash)
      elsif name_or_hash.is_a?(Hash)
        @theme = Theme.new(name_or_hash)
      end
    end

    def grid(columns:, &block)
      comp = Component.new("div", { class: "grid grid-cols-#{columns} gap-4" }, &block)
      @root_children << comp
      comp
    end

    def form(action:, method: "POST", &block)
      comp = Component.new("form", { action: action, method: method }, &block)
      @root_children << comp
      comp
    end

    def to_html
      @root_children.map(&:to_html).join("\n")
    end
  end
end
