# Jekyll plugin that marks external links

In rendered HTML contents of each Jekyll document or page,
updates `<a>` elements that point to external sites as follows:

- Adds `rel="external"` attribute
- Adds inner HTML markup with external link icon

You can specify a CSS selector for which links are to be evaluated,
and a list of selectors for which links are to be ignored
(ignored selectors take precedence).

## Which links are considered external

A link is considered external if:

* Its `href` attribute value starts with “http” or “https”, and
* the domain name following “http(s)://” is not equal to the
  domain name part from site’s URL,
  if such is specified in Jekyll configuration as `url`.

## Compatibility and dependency notes

* Tested with Jekyll 4.3.2; see example site’s gem lockfile for further details.
* Depends on Nokogiri for detecting and marking external links.

## Configuration

Example configuration with defaults:

```
external_links:
  selector: 'main a'
  ignored_selectors:
    - a[href*=travis]
    - a[href*=coverity]
    - a[href*=codecov]
  marker_html: "<span class='ico-ext'><i class='fas fa-external-link-square-alt'></i></span>"
```

Note the assumptions made by the defaults:

* Links you want to be marked as external are always within the `<main>` tag.

* You use Font Awesome in your site.

* Links containing “travis”, “coverity” and “codecov”
  are only used in badges, and you don’t want to process those.

If some of these assumptions don’t apply to your site,
you can add that structure to your `_config.yml` and customize the values.

### `external_links.selector`

Only links matching this CSS path will be processed.

### `external_links.marker_html`

The specified HTML markup will be added inside each `<a>` tag
that’s detected as external link.

By default, the Font Awesome’s `fa-external-link-square-alt` icon is used,
which requires your site to have Font Awesome initialized.

You can set `marker_html` to empty string and style links with a custom CSS rule
(e.g., `a[rel=external] { border-bottom-style: dashed; }`), though it’s less flexible.

### `external_links.ignored_selectors`

Even if a link matches `selector`, it won’t be altered if it also matches any of these
selectors.

### `url`

The `url` option in your Jekyll configuration is used when deciding
whether a given link is external or not. If not specified,
only domain-relative links are considered internal.

## Example site

An example site is included in this repo.
Use it to demo the plugin and to test it during development.
The `/` path leads to Markdown version, the `/asciidoc/` path leads to AsciiDoc version.

1. Clone this repository
2. Navigate into the example-site directory
3. Run `bundle`
4. Run `bundle exec jekyll serve`
5. Open in your favorite browser the URL shown

Note that, due to the fact that gem lockfiles are platform-specific,
it may not work out of the box.

The example site build may output deprecation warnings
coming from the default Minima theme
not being fully compatible with the latest Jekyll/SASS stack.

## Contribution

Contributions are welcome.

It’s appreciated if you also update the bundled example site to illustrate
the changes in your PR. The example site adds the plugin via a relative path,
and any changes you make to plugin code will take effect on next rebuild.
