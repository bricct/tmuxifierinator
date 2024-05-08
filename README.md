# Tmuxifierinator

A silly tool that just runs a sed command to replace names and roots paths of tmuxifier layouts

I use it in conjunction with tmux, tmuxifier, and git worktree to be able to create tmux sessions of a given
layout for each worktree of a repo that I pull down.

## Installation

Clone the repo somewhere, I keep mine in `$HOME/.tmuxifierinator`

Add the following to your `.bashrc / .zshrc / whatever`

```bash
export TMUXIFIER_TEMPLATE_PATH="$TMUXIFIER_LAYOUT_PATH/templates"
export PATH="$HOME/.tmuxifierinator:$PATH"
```

and since I foolishly named this thing, I also aliased it to tmfi
```bash
alias tmfi='tmuxifierinator'
```

## Dependencies 

I use this to make tmuxifier more powerful, so you'll need tmuxifier.

## Usage

The tool has three required flags and that's it.

I don't know why I didn't just use positional parameters but oh well.

Here's an example of how I uses it.
```bash
tmfi --session $name --root $proj_root/worktrees/$name --template $template
```

`--session or -s` names the tmuxifier session.

`--root or -r` defines the root of the tmuxifier session, here I'm setting it to a git worktree of the same name as the session.

`--template or -t` defines the template of the session to use, which should be found in your file system at `$TMUXIFIER_TEMPLATE_PATH/<value>.session.template.sh`.


Here's an example of a tmuxifier template file:
```bash
# Set a custom session root path.
session_root "{{root}}"

# Create session
if initialize_session "{{session}}"; then

  # Load a defined window layout.
  load_window "my_window"
  load_window "my_second_window"

  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
```
It's just a tmuxifier layout with the session_root and initialize_session set to two strings that get replaced by your flags.
