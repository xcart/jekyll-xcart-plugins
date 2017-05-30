# X-Cart Jekyll plugins

This repo contains several Jekyll plugins used in Knowledge Base sites:

- Auto `raw` code block wrapper. Wraps each code block in `raw` Liquid tag. Also makes php to start_inline=1.
- L10n plugin and global handlers. Adds `language_selector` Liquid tag.
- Links and references. Adds `link` and `ref` plugins to generate unique persistent links on local pages. Uses `id` param to identify a page (should be unique string).
  `link` creates markdown styled link, e.g. `{% link "creating a module" ref_i2sF24sa %}`.
  `ref` returns page url by identifier, e.g. `{% ref ref_u8kJ3imU %}`.
- Markup helpers. `note` tag wraps content to out standing block (possible modifiers - `info`, `danger`, `warning`). `tabs` tag uses Semantic UI markup of the tabs block. Each `tabs` should contain 1+ `tab` tags with tab name as argument. Only single `tabs` instance is supported on the page right now.
- Navigation plugin adds `navigation_menu` tag. Automatically builds nested menu of the pages. `Uses navigation_starting_level` config param to determine starting level (default: 2).
- Pagination plugin based on jekyll/jekyll-paginate. Specify `paginate_count` (count of the articles on the page) and `paginate_path` (e.g."/en/blog/page:num/") config parameters.

# Install

The best way to install this is to add it to a Bundler Gemfile for your Jekyll.

``` ruby
group :jekyll_plugins do
  gem 'jekyll-xcart-plugins'
end
```

Then run `bundle install` to install the gem and its dependency. For
the immediate term, you might need to actually install the gem
directly from Github (this is also how to get the latest version)

``` ruby
group :jekyll_plugins do
  gem 'jekyll-xcart-plugins', github: "xcart/jekyll-xcart-plugins", branch: "master"
end
```

# Public domain

This project is in the worldwide [public domain](LICENSE.md). As
stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and
>copyright and related rights in the work worldwide are waived through
>the
>[CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>All contributions to this project will be released under the CC0
>dedication. By submitting a pull request, you are agreeing to comply
>with this waiver of copyright interest.
