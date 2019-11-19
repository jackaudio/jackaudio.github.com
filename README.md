# jackaudio.org

This repository contains the sources for the [jackaudio.org] homepage.

To report bugs and issues with JACK, please use the corresponding
[JACK 1] and [JACK 2] bug trackers.

## Contribute

You can currently contribute to the homepage by checking the page for dead/wrong
links and formatting mistakes and file bugreports about them.

If you feel comfortable fixing issues yourself, please file a [pull request].

If you want to help out on the style part, you are more than welcome to clone the
repo and start hacking but please communicate about your vision,
so there won't be any drama.

If you have any ideas or suggestions, please feel free to contact the authors via
jack-devel mailinglist or on Github.

## Test with Jekyll locally

In order to test the website without having a webserver running and also see
the changes in real time use the `_setup.sh` script to run [Jekyll] locally from
the repository directory.

It requires [ruby] to be installed, the rest will be installed locally in a
`.bundle` directory.

The current Gemfile configuration is set to use the same
Jekyll version as [GitHub pages].

The website will be available at <http://localhost:4000/>.

If using another webserver you'll need to point it to the built `_site` directory.

## Adding FAQ pages

1. Create a new *.md file in the FAQ directory
2. Insert a [front-matter] header as in the other files in the FAQ directory,
   they are required for Jekyll to process the file
3. Add your content in markdown format
4. Link to your new FAQ page in the `/faq/index.md` page

Please note, that all FAQ pages currently need `.html` appended,
since they share the same directory.

## Creating posts

This can be done either manually by creating a new .md file
in the [_posts] directory, paying attention for a correct filename, date and
[front-matter], or by running the following command:

```bash
$ ./newpost.sh "New post title" author_name
```

## Development notes

- Please use an [EditorConfig] compatible editor to avoid indentation,
  whitespaces and missing lines at EOF issues.
- Desired line length maximum is 82 columns.
- See above to how to test page's changes with Jekyll.
- For further information please refer to the [Jekyll manual].
- Use external hosting links for the download section like [GitHub releases],
  no download files in the repository for a better maintenance.

## TODO

- A dedicated news/releases section? E.g. a secondary [blog],
  custom [_posts] like directory.

[jackaudio.org]:   https://jackaudio.org
[JACK 1]:          https://github.com/jackaudio/jack1/issues
[JACK 2]:          https://github.com/jackaudio/jack2/issues
[pull request]:    https://github.com/jackaudio/jackaudio.github.com/pulls
[Jekyll]:          https://jekyllrb.com/
[_posts]:          https://github.com/jackaudio/jackaudio.github.com/tree/master/_posts/
[front-matter]:    https://jekyllrb.com/docs/front-matter/
[GitHub pages]:    https://pages.github.com/versions/
[EditorConfig]:    https://editorconfig.org/
[Jekyll manual]:   https://jekyllrb.com/docs/
[GitHub releases]: https://help.github.com/en/github/administering-a-repository/about-releases
[blog]:            https://github.com/wxWidgets/website/tree/master/blog
