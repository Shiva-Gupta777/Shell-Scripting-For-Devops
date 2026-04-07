#!/bin/bash

# =========================================
# 1. Script Info
# =========================================
echo "Script name: $0"          # $0 → script ka naam
echo "----------------------------------"

# =========================================
# 2. Basic Arguments
# =========================================
echo "First argument: $1"       # $1 → first input
echo "Second argument: $2"      # $2 → second input
echo "Third argument: $3"       # $3 → third input
echo "----------------------------------"

# =========================================
# 3. Total Arguments Count
# =========================================
echo "Total arguments passed: $#"
echo "----------------------------------"

# =========================================
# 4. All Arguments
# =========================================
echo "All arguments using \$@: $@"
echo "All arguments using \$*: $*"
echo "----------------------------------"

# =========================================
# 5. Loop Through Arguments
# =========================================
echo "Loop through arguments:"
for arg in "$@"
do
    echo "Argument: $arg"
done
echo "----------------------------------"

# =========================================
# 6. Check if Argument Provided
# =========================================
if [ -z "$1" ]; then
    echo "No argument provided ❌"
else
    echo "Argument provided ✅"
fi
echo "----------------------------------"

# =========================================
# 7. Real DevOps Example
# =========================================
# User gives package name like nginx

package=$1

if [ -z "$package" ]; then
    echo "Please provide package name"
else
    echo "Installing package: $package"
    # sudo apt install -y $package   # (safe ke liye comment)
fi
echo "----------------------------------"

# =========================================
# 8. Process Info
# =========================================
echo "Process ID: $$"
echo "Last command status: $?"
echo "----------------------------------"

# =========================================
# 9. Combine Arguments
# =========================================
echo "Hello $1, your age is $2 and city is $3"
echo "----------------------------------"

# =========================================
# END
# =========================================
