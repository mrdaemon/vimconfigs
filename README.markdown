Vim Config Files
==================

These are my configuration files for the Vi Improved (vim) text editor. Feel free to use them as necessary. 
The vimrc is well commented. Some packages may or may not suit you, but feel free to browse.

Notes
-----

I recently switched to using Pathogen to manage the plugins as bundles. This also allows me to just toss the plugin's git repository in there and have it automagically updated on request.

After a fresh clone, you should do:
`git submodule update --init --recursive`
to fetch the bundles.

### Caveats and potential problems

Things worth of mention:

* I rather selfishly force the terminal to support 256 colors. It's not very clean and you might not want that.
* I use Consolas as a GUI font. Change that if you don't have it -- it's an evil, evil proprietary font by Microsoft, lifted from the windows installation on my workstation, so I like to think the license applies.
* The snippets are incredibly broken and I don't know why I keep them on
* Supertab behaves strangely at times, preventing me from inserting a tab at the worst of times. Ctrl+space fixes it. I have yet to fix that.
* I use (rarely) vicle with a Python interpreter in GNU Screen to get a more lisp-like experience, but that too is rather fickle. It may not like me, just the _concept_ of me. Which hurts so much more :(
* I don't think my omnicomplete is setup correctly. I'm still merging my vim config from a bazillion machines, and just pushed this from my internal mercurial repos to the public one.


### Comments, problems, questions

Feel free to ask anything -- or if you found something useful, contribute back fixes to whatever was broken :) I'll merge it back!

Links and shameless plugs:
--------------------------

* [Blog: Vitriol and Routing Tables](http://www.raptorized.com/)
* [Code and Network Services: underwares.org](http://www.underwares.org/)


