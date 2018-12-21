# Vis Super Shellout

This is a plugin for [vis](https://github.com/martanne/vis). For
further Information on plugins please refer to the
[wiki](https://github.com/martanne/vis/wiki/Plugins). To use this plugin
simply download and add the following line to your `visrc.lua`:

    require('super-shellout')

Super-shellout provides a custom version of the standard `:<` command,
callable as `:R` (think of it as `R`ead from shell command). The main
reason for writing super-shellout was that `:<` would not work with the
[cite](https://github.com/seifferth/cite) command I use for inserting
citekeys into [pandoc-markdown](http://pandoc.org/MANUAL.html#citations)
documents. The code was heavily inspired by Guillaume Chérel's
[vis-fzf-open](https://github.com/guillaumecherel/vis-fzf-open).

`:R` differs from `:<` in the following aspects:

- Stderr is released, so that commands run as `:R command` can use stderr
  for drawing user interfaces (like
  [fzf](https://github.com/junegunn/fzf) and
  [vis itself](http://martanne.github.io/vis/man/vis.1.html#DESCRIPTION)
  may do).
- Trailing newline is removed. Most shell command output ends with
  `\n`. By automatically removing this character I can run commands like
  `:R date` in a more convenient manner.
- The cursor will be placed at the end of the inserted text, not the
  beginning (as with `:<`).
