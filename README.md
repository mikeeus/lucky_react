# lucky_react

LuckyReact provides elper methods for rendering React components in Lucky apps that are using the [lucky-react](https://github.com/mikeeus/lucky-react) module.

[![GitHub release](https://img.shields.io/github/release/mikeeus/lucky_react.svg)](https://github.com/mikeeus/lucky_react/releases)
[![Build Status](https://travis-ci.org/mikeeus/lucky_react.svg?branch=master)](https://travis-ci.org/mikeeus/lucky_react)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  lucky_react:
    github: mikeeus/lucky_react
```

## Usage

Make sure you've installed [lucky-react](https://github.com/mikeeus/lucky-react) and added it to your app.

Then in a Lucky page you can include the `LuckyReact` module and use the `react` method.

```crystal
require "lucky_react"

class Home::IndexPage < GuestLayout
  include LuckyReact

  def content
    react "Wrapper" do # with a block
      h1 "Nested Header"
    end

    messages = [
      { id: 1, sender: "me", text: "Hi" },
      { id: 2, sender: "Chatbot", text: "Hello! How can I help?" }
    ]

    react "Chat", { messages: messages } # with props
  end
end
```

The `react` method will render divs with `[data-react-class=Component]` and `[react-data-class={"props": "props"}]` attributes that are picked up by [lucky-react](https://github.com/mikeeus/lucky-react) .

## Contributing

1. Fork it (<https://github.com/your-github-user/lucky_react/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [mikeeus](https://github.com/mikeeus) Mikias Abera - creator, maintainer
