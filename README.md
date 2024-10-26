# Installation
- Install stow https://www.gnu.org/software/stow/
- Clone the repo in ~/.dotfiles/

# Usage
Inititalize
```bash
cd ~/.dotfiles
stow .
```
Rebuild symlinks after change
```bash
cd ~/.dotfiles
stow -R .
```
Remove symlinks
```bash
cd ~/.dotfiles
stow -D
```
