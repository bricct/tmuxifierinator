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
