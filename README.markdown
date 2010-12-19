Vim Config Files
==================

These are my configuration files for the Vi Improved (vim) text editor. Feel free to use them as necessary. 
The vimrc is well commented. Some packages may or may not suit you, but feel free to browse.

Windows Version
---------------

The windows version of my config is kept in the aptly named branch, win32-base.
I routinely commit and merge patches randomly between systems, some random machine-specific branches may appear

To install, run "install.cmd". It will create links to the relevant directories in %USERPROFILE%. If mklink is not available, or your windows version is not windows 2008/Windows 7, it will do a plain file copy.

Mercurial
---------

Also, keep in mind that I mainly use mercurial, and that the github repos is mostly a public mirror.
I need to tweak my hgweb setup before I allow public access to the primary mercurial repos -- but I do push changes to github routinely, for the greater good. Delicious code bazaar.

Notes
-----

Do note that while the vimrc is kept clean within reasonable limits, the rest of the vimballs and plugins may be in various states of decrepitude. Still merging them from various computers I have been hacking on.

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


