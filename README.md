# Jekyll plugin that marks external links

In each Jekyll document or page content, updates `<a>` elements that point
to external sites as follows:

- Adds `rel="external"` attribute
- Adds inner HTML markup with external link icon

You can specify a CSS selector for which links are to be marked,
and a list of selectors for which links are to be ignored
(ignored selectors take precedence).

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

As you can see, by default the Font Awesome’s `fa-externa-link-square-alt` icon is used,
which implies that you are using Font Awesome.

You can set marker_html to empty string and style links with custom CSS rule
(e.g., `a[rel=external] { border-bottom-style: dashed; }`), though it’s less flexible.
