#!/bin/bash

# Find all .py files and loop through them
find / -type f -name '*.py' -print0 | while IFS= read -r -d '' file; do
    # Add shebang line to the top of each file
    {
        echo "#!/usr/bin/env python3"
        cat "$file"
    } > "$file.tmp"
    mv "$file.tmp" "$file"
    chmod +x "$file"
done
