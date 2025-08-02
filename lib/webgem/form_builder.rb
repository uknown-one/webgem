module Webgem
  class FormBuilder
    def initialize(action:, method: "POST")
      @form = Component.new("form", { action: action, method: method })
    end

    def input(name:, label: nil, type: "text", **attrs)
      wrapper = Component.new("div", class: "form-group")
      if label
        l = Component.new("label", for: name)
        l.text(label)
        wrapper.add(l)
      end
      input_attrs = { name: name, type: type, id: name }.merge(attrs)
      wrapper.add(Component.new("input", input_attrs))
      @form.add(wrapper)
    end

    def submit(text = "Submit")
      button = Component.new("button", { type: "submit", class: "btn" })
      button.text(text)
      @form.add(button)
    end

    def to_component
      @form
    end

    def to_html
      @form.to_html
    end
  end
end
