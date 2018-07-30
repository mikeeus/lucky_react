require "./lucky_react/*"
require "json"

# Include in a Lucky page and call react to render divs with `[react-data-class]
# ` and `[react-data-props]` attributes set that can be picked up by the
# `lucky-react` script.
#
# Example
#
# class Home::IndexPage < GuestLayout
#   include LuckyReact
#
#   def content
#     react "Wrapper" do # with a block for nesting
#       h1 "Nested Header"
#     end
#
#     messages = [
#       { id: 1, sender: "me", text: "Hi" },
#       { id: 2, sender: "Chatbot", text: "Hi! How can I help?" }
#     ]
#
#     react "Chat", { messages: messages } # with props
#   end
# end
#
module LuckyReact
  def react(class_name : String, tag : String? = "div")
    tag tag, "data-react-class": class_name
  end

  def react(class_name : String, tag : String? = "div", &block)
    tag tag, "data-react-class": class_name do
      yield
    end
  end

  def react(class_name : String, props : NamedTuple | JSON::Any, tag : String? = "div")
    tag tag, "data-react-class": class_name, "data-react-props": props.to_json
  end

  def react(class_name : String, props : NamedTuple | JSON::Any, tag : String? = "div", &block)
    tag tag, "data-react-class": class_name, "data-react-props": props.to_json do
      yield
    end
  end
end
