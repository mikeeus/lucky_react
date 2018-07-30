require "./spec_helper"

describe LuckyReact do
  it "passes class and props arguments to tag method" do
    page = LuckyPage.new
    page.render_component_with_props("Component", {this: "works"})

    expected_args = {
      "data-react-class": "Component",
      "data-react-props": {"this" => "works"}.to_s,
    }

    page.should_have_called("tag", expected_args)
  end

  it "calls nested methods on page" do
    page = LuckyPage.new

    page.render_nested_div("Wrapper")

    page.should_have_called "tag", {"data-react-class": "Wrapper"}
    page.should_have_called "div"
  end
end

class LuckyPage
  include LuckyReact

  getter calls = [] of {name: String, args: Hash(Symbol, String)} | {name: String}

  def render_component_with_props(class_name, props)
    react class_name, props
  end

  def render_nested_div(class_name)
    react class_name do
      div
    end
  end

  def tag(component_name : String, **args)
    @calls << {name: "tag", args: args.to_h}
  end

  def tag(component_name : String, **args, &block)
    @calls << {name: "tag", args: args.to_h}
    yield
  end

  def div
    @calls << {name: "div"}
  end

  def should_have_called(name, with args = nil)
    if args
      @calls.includes?({name: name, args: args.to_h})
    else
      @calls.includes?({name: name})
    end
  end
end
