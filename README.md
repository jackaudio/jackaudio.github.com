# jackaudio.org

[jackaudio.org](http://jackaudio.org)

[this repository(preview on github pages)](https://jackaudio.github.io)

## install
just clone the repository and point your webserver to the '_site' dir

## Adding FAQ Pages
1.  create a new *.md file in the faq directory
2.  insert a header as in the other files in the faq dir, they are required for
    jekyll to process the file
3. Add your content in markdown format
4. link to your new FAQ page in the /faq/index.md page, please note, that all FAQ
   pages currently need '.html' appended, since they share the same directory.

## contribute
You can currently contribute by checking the page for dead/wrong links and
formatting mistakes and file bugreports about them.

If you feel comfortable fixing issues yourself, please file a pull request.

If you want to help out on the style part, you are more than welcome to clone the
repo and start hacking but please communicate about your vision, so there won't be 

If you have any ideas or suggestions, please feel free to contact the authors via 
jack-devel mailinglist or on github.

## site internal links
### relative to site root
    [name to display](/path/to/file)
### relative to page
    [name to display](to/file)
### faq page
    [name to display](/faq/file.html)


## Open considderations
*  The downloadable files will have to be placed in the 'downloads' dir after
   cloning the repo. That's a hassle, but including them in this repo would just
   bloat the repo more and more with each release.
*  a news/releases section
* how to handle the '_site' dir? it needs to be included for easy deployment
  without running jekyll on the webserver side, on the other hand it holds a full
  copy of the images and all binary files. AFAIK you cannot safely place thouse
  files only in the '_site' dir, since this dir gets cleaned by jekyll.
