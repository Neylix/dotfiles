# Installation
- Install stow https://www.gnu.org/software/stow/
- Clone the repo in ~/.dotfiles/

# Usage
package refer to a folder in ~/.dotfiles/
run the commands from the ~/.dotfiles/
to specify a destination directory, use -t option

stow a package
```bash
cd ~/.dotfiles
stow [package name]
```
unstow a package
```bash
cd ~/.dotfiles
stow -D [package name]
```
