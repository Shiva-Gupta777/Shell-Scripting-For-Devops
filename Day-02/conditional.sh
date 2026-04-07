#!/bin/bash

# =========================================
# 1. Check number (Adult or Minor)
# =========================================

age=$1

if [ -z "$age" ]; then
    echo "Please provide age as argument"
else
    if [ $age -ge 18 ]; then
        echo "You are Adult"
    else
        echo "You are Minor"
    fi
fi

echo "----------------------------------"

# =========================================
# 2. String comparison
# =========================================

name=$2

if [ "$name" = "Shiva" ]; then
    echo "Welcome Shiva"
elif [ "$name" = "Rahul" ]; then
    echo "Welcome Rahul"
else
    echo "Unknown user"
fi

echo "----------------------------------"

# =========================================
# 3. Check empty string
# =========================================

if [ -z "$3" ]; then
    echo "Third argument is empty"
else
    echo "Third argument is: $3"
fi

echo "----------------------------------"

# =========================================
# 4. File check
# =========================================

if [ -f "test.txt" ]; then
    echo "File test.txt exists"
else
    echo "File test.txt does not exist"
fi

echo "----------------------------------"

# =========================================
# 5. DevOps style example
# =========================================

package=$4

if [ "$package" = "nginx" ]; then
    echo "Installing nginx..."
elif [ "$package" = "apache2" ]; then
    echo "Installing apache2..."
else
    echo "Package not supported"
fi

echo "----------------------------------"

# =========================================
# END
# =========================================
