# Christian Garbin blog

Personal blog - published [here](https://cgarbin.github.io/).

The blog uses [Jekyll](http://jekyllrb.com/) and the [Minimal Mistakes theme](https://mmistakes.github.io/minimal-mistakes/).

## Adding tags and categories pages

This method uses [the jekyll-archives plugin](https://github.com/jekyll/jekyll-archives).

The instructions below are based on the [Minimal Mistakes documentation](https://mmistakes.github.io/minimal-mistakes/docs/configuration/#archive-settings). If there is any discrepancy between the instructions and the plugin documentation, follow the plugin documentation.

Add the plugin to the `Gemfile`:

```text
group :jekyll_plugins do
  gem "jekyll-archives"
end
```

Install the plugin:

```bash
bundle install
```

Add the plugin to the `plugins` section in `_config.yml`:

```yaml
plugins:
  ...
  - jekyll-archives
```

Set the `..._archives` variables in `_config.yml` to use the plugin:

```yaml
category_archive:
  type: jekyll-archives
  path: /categories/
tag_archive:
  type: jekyll-archives
  path: /tags/
```

Uncomment (or add) the plugin configuration section in `_config.yml`:

```yaml
jekyll-archives:
  enabled:
    - categories
    - tags
  layouts:
    category: archive-taxonomy
    tag: archive-taxonomy
  permalinks:
    category: /categories/:name/
    tag: /tags/:name/
```

Copy the Minimal Mistakes tag and categories pages.

```bash
mkdir _pages
cp docs/_pages/category-archive.md _pages
cp docs/_pages/tag-archive.md _pages
```

Regenerate the site (stop and restart `bundle exec jekyll serve`).
