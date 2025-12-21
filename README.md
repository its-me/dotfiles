## hotkeys

### niri

| hotkey | action |
| :--- | :--- |
| Super+Shift+/ | show hotkeys panel |
| Mod+Shift+R | switch window height |
| Mod+[ | move window to column on left |
| Mod+] | move window to column on right |

## zsh aliases

### git

| alias | command |
| :--- | :--- |
| `g` | `git` |
| `g a <list of files>` | `git add <list of files>` |
| `g c <commit message>` | `git commit -a -m <commit message>` |
| `g p` | `git push` |
| `g cp <commit message>` | `git add . && git commit -a -m <commit message> && git push` |
| `g l` | `git log` |
| `g s` | `git status` |

### chezmoi

| alias | command |
| :--- | :--- |
| `cz` | `chezmoi` |
| `cz s` | `chezmoi status` |
| `cz e <file>` | `chezmoi edit <file>` |
| `cz d` | `chezmoi diff` |
| `cz a` | `chezmoi apply -v` |
| `cz c <commit message>` | `chezmoi git add . && chezmoi git commit -- -a -m <commit message>` |
| `cz p` | `chezmoi git push` |
| `cz cp <commit message>` | `chezmoi git add . && chezmoi git commit -- -a -m <commit message> && chezmoi git push` |

### neovim

| alias | description |
| :--- | :--- |
| `nvim u` | update neovim plugins |

### kopia

| alias | command |
| :--- | :--- |
| `k b` | `sudo kopia snapshot create /etc && kopia snapshot create ~` |
| `k s` | `sudo kopia snapshot list /etc && kopia snapshot list ~` |
