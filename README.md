#dogmatic.vim - Arrow keys are heretical
Dogmatic is a Vim plugin that disables the arrow keys and lets you know how
often you try to use them.

I __don't recommend__ Dogmatic for new Vim users, but once you are ready to
fully embrace Vim you should find this plugin to be helpful in leveling up
your muscle memory of Vim's movement mappings.

Dogmatic does not prevent you from using the arrow keys on the cmdline.

##Installation
I recommend using pathogen to manage your Vim plugins.  If you wish to manually
install this plugin, copy the dogmatic.vim file into your ~/.vim/plugin
directory.

## Usage
Once you install the dogmatic.vim plugin it will automatically disable your
arrow keys. Vim will show a message at the bottom of the window when you try to
use your arrow keys.

In order to see Dogmatic's output in Insert mode you will need to add this line to your vimrc.

    set cmdheight=2

You can set a timeout value (in milliseconds) for Dogmatic so that it will only count the first arrow press in a sequence where you press multiple arrow keys

    :let g:dogmatic_timeout = 1000  "one second timeout

or

    :let g:dogmatic_timeout = 500   "half a second timeout

Note that if Vim is not compiled with the `+reltime` feature, the minimum interval between key presses that Dogmatic can see is 1 second, meaning any value of `g:dogmatic_timeout` below 1000 will be regarded as 0.
