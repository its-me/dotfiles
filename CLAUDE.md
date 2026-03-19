# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a [chezmoi](https://chezmoi.io) dotfiles repository managing personal system configuration for an Arch Linux system running the Niri Wayland compositor. It uses 1Password for secret management and `rage` (Rust age implementation) for file encryption.

## Common Commands

All chezmoi operations are run from this source directory or via `chezmoi` CLI:

```sh
chezmoi status          # show pending changes (alias: cz s)
chezmoi diff            # diff between source and target (alias: cz d)
chezmoi apply -v        # apply changes to home directory (alias: cz a)
chezmoi edit <file>     # edit a target file (alias: cz e <file>)
```

Committing and pushing changes:
```sh
# Stage, commit, and push in one step:
chezmoi git add . && chezmoi git commit -- -a -m "message" && chezmoi git push
# (alias: cz cp <message>)
```

## Architecture & Key Concepts

### File Naming Conventions (chezmoi source state attributes)
- `dot_` prefix → maps to `.` in target (e.g., `dot_zshrc` → `~/.zshrc`)
- `private_` prefix → file has 0600 permissions
- `encrypted_` prefix → age-encrypted file (decrypted on apply)
- `run_onchange_after_` → script that runs when its content changes
- `.tmpl` suffix → Go template processed before applying
- Reference: https://www.chezmoi.io/reference/source-state-attributes/

### Encryption
- **Tool**: `rage` (age-compatible, Rust implementation)
- **Identity key**: `~/.config/chezmoi/age.key`
- **Recipient**: fetched from 1Password at `op://Personal/chezmoi/recipient`
- Configured in `.chezmoi.yaml.tmpl`

### Secret Management
- **1Password** is the central secret store (CLI: `op`)
- Secrets are injected into templates via `{{ onepasswordRead "op://..." }}`
- Two encrypted shell files hold runtime secrets:
  - `encrypted_dot_zshrc.local.secrets.age` → decrypts to `~/.zshrc.local.secrets` (secret aliases)
  - `encrypted_private_dot_zshenv.secrets.age` → decrypts to `~/.zshenv.secrets` (env vars like `TAKEOUT_AGE_KEY`, `TAKEOUT_B2_BUCKET`, etc.)

### External Files
`.chezmoiexternal.toml` downloads the `takeout-merge` binary from GitHub (`its-me/google-takeout` repo) into `~/.local/bin/`.

### Post-Apply Scripts
`run_onchange_after_systemd-user-reload.sh.tmpl` runs `systemctl --user daemon-reload` and enables `trashy-clean.timer` when systemd unit files change.

## Key Configurations Managed

| Tool | Source Path | Notes |
|---|---|---|
| Zsh | `dot_zshrc.local`, `dot_zshenv` | Main shell config; see aliases below |
| Git | `dot_gitconfig` | GPG signing enabled by default |
| Neovim | `private_dot_config/nvim/` | NvChad + lazy.nvim |
| Niri | `private_dot_config/niri/` | Wayland compositor (KDL config) |
| Kopia | `private_dot_config/kopia/` | Backup to B2 + snapshot config |
| Systemd user units | `private_dot_config/systemd/user/` | trashy-clean, clipcat |
| Darkman | `private_dot_local/private_share/darkman/` | Light/dark theme scripts |
| SSH | `private_dot_ssh/` | Keys and config |

## Shell Aliases (defined in `dot_zshrc.local`)

Key aliases to be aware of when editing the shell config:

- `cz` → chezmoi wrapper (see README.md for subcommands)
- `p` → paru (AUR helper; `p i`, `p u`, `p q`)
- `k b` / `k l` → kopia backup/list snapshots
- `g` → git shorthand (`g c`, `g p`, `g cp`, etc.)
- `d` → docker shorthand
- `f` → flutter shorthand
- `rage e`/`rage d` → encrypt/decrypt files via custom wrapper using 1Password key
- `to b`/`to r` → Google Takeout backup/restore automation
- `shred` → secure file wipe wrapper

## Important Notes

- **SSH agent**: configured via 1Password at `~/.1password/agent.sock`
- **Git commits**: GPG-signed by default (key: `3E3DC5D6AEFC998F`)
- **File deletion**: `trashy` is used instead of `rm`; trash auto-cleans after 30 days via systemd timer
- **Theme switching**: Darkman orchestrates light/dark mode across Mako, Neovim, and GNOME color scheme
- The `README.md` is listed in `.chezmoiignore` — it stays in the repo but is not deployed to `~`
