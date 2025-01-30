#!/bin/bash

set -euo pipefail

echo "Updating /etc/profile"
profile="/etc/profile"

awk '
    /^append_path/ {
        last_append_line = NR
    }
    { lines[NR] = $0 }
    END {
        for (i=1; i<=NR; i++) {
            print lines[i]
            if (i == last_append_line) {
                print "# check to see if a user'\''s id is >= 1000 and the $HOME/bin directory exists.  If so, append it to $PATH"
                print "if [ \"$(id -u)\" -ge 1000 ] && [ -d \"$HOME/bin\" ]; then"
                print "    append_path \"$HOME/bin\""
                print "fi"
            }
        }
    }
' "$profile" > "${profile}.tmp" && mv "${profile}.tmp" "$profile"

cat <<'EOF' >> "$profile"

# Set global environment variables (can be overwritten in each user's .bash_profile)
export EDITOR=vim
export VISUAL=vim
export PAGER=less
EOF

echo "" 