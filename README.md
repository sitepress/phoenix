# Sitepress in Phoenix

This is NOT `sitepress-ex`; rather its a Phoenix app I'm using to learn my way around Elixir and Phoenix to potentially build such a library. I'm completely new to Elixir and Phoenix, so you will see me confidentiality try really stupid and naive things in this repo.

Why am I even interested in this? Phoenix has a really awesome templating system that I think could be a great way to build content sites, even if there's no dynamic piece of the application.

The reality is that most of us want to ship a dynamic application and have some content in the form of a small landing page, maybe some legal stuff, and support docs. I think this addition to Phoenix could be really compelling in terms of helping people quickly ship full applications to the interwebs.

Regardless of framework, I think its a huge missed opportunity for frameworks like Rails and Phoenix to not have content work out of the box. Sitepress intends on promoting the idea that a frameworks very first step in a "Getting Started" guide could be "Edit the home page at `./content/index.html.heex`".

## Technical Goals

This section will be updated as I continue learning more about Elixir, Phoenix, and serving up content. If you're familiar with Phoenix and Elixir, not much will impress you here, but I'm also not trying to impress you 🤣.

### [WIP] How can the `PageController` serve up content from `./lib/sitepress_web/controllers/page_html/**/*`

When I request `/about/me` from my browser, it should serve up `./about/me.html.heex`. `/about` should serve up `./about.html.heex`

The router has the following rule defined:

```elixir
scope "/", SitepressWeb do
  pipe_through :browser

  get "/", PageController, :home
  get "/*path", PageController, :show
end
```

That routes to the controller which should render templates embedded in a directory.

#### Problem

Embedding templates with a recursive pattern as follows won't work:

```elixir
defmodule SitepressWeb.PageHTML do
  use SitepressWeb, :html

  # This doesn't work
  embed_templates "page_html/**/*"
end
```

The `embed_templates/1` method only handles files in the immediate directory because they don't map cleanly to function names.

I have a bunch of notes from Chris M to work from, and even more research I need to do coming in from Ruby to understand some of the basics of compilation and Phoenix.

### How can I add page routes to the Phoenix's path sigil to give errors if the page doesn't exist?

TODO

### How can I plug Markdown and Frontmatter parsers into the controller?

TODO

### How can I compile these out into static HTML, if desired?

There's a ton of prior art here that I've seen on the web and need to list out here. My requirement is that this MUST work with Phoenix since I'm convinced that I'm write that static site compilers should be built on that languages most popular web framework. In the long run it means way less code for the site builder has to be maintained since the framework team deals with that.

## Getting started

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
