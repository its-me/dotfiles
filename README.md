## hotkeys

### niri

| hotkey | action |
| :--- | :--- |
| Super+Shift+/ | show hotkeys panel |
| Mod+Shift+R | switch window height |
| Mod+[ | move window to column on left |
| Mod+] | move window to column on right |

### zsh

| hotkey | action |
| :--- | :--- |
| Ctrl+R | run hstr |

## zsh aliases

### paru

| alias | command |
| :--- | :--- |
| `p` | `paru` (`paru -Syu` with no arguments) |
| `p i <packages>` | `paru -S <packages>` |
| `p id <packages>` | `paru -S --asdeps <packages>` |
| `p u <packages>` | `paru -Rus <packages>` |
| `p q [packages]` | `paru -Qi [packages]` |

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
| `cz g [args]` | `chezmoi git [args]` |
| `cz g s` | `chezmoi git status` |
| `cz g l` | `chezmoi git log` |

### rage

| alias | description |
| :--- | :--- |
| `rage e <key_file> <file_to_encrypt> [encrypted_output]` | Encrypt file |
| `rage d <key_file> <encrypted_file> [output_file]` | Decrypt file |

### kopia

| alias | command |
| :--- | :--- |
| `k b` | `sudo kopia snapshot create /etc && kopia snapshot create ~` |
| `k l` | `sudo kopia snapshot list /etc && kopia snapshot list ~` |

### neovim

| alias | description |
| :--- | :--- |
| `nvim u` | update neovim plugins |

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

### docker

| alias | command |
| :--- | :--- |
| `d [args]` | `docker [args]` |
| `d b <args>` | `docker build <args>` |
| `d i [args]` | `docker images --all [args]` |
| `d r <args>` | `docker rm <args>` |
| `d ri <args>` | `docker rmi <args>` |
| `d s <args>` | `docker stop <args>` |
| `d sr <args>` | `docker stop <args> && docker rm <args>` |

### flutter

| alias | command |
| :--- | :--- |
| `f [args]` | `flutter [args]` |
| `f b <args>` | `flutter build <args>` |
| `f c [args]` | `flutter clean [args]` |
| `f r [args]` | `flutter run [args]` |
| `f d [args]` | `flutter devices [args]` |
| `f e [args]` | `flutter emulators [args]` |
