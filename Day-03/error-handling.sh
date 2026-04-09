#!/bin/bash

echo "===== ERROR HANDLING DEMO START ====="

# =========================================
# 1. Basic Exit Status ($?)
# =========================================
echo "1. Checking exit status"

ls testfile.txt   # file exist nahi hai (error)

echo "Exit status of last command: $?"   # non-zero = error

echo "----------------------------------"

# =========================================
# 2. Using if condition with $?
# =========================================
echo "2. Handling error using if"

ls testfile.txt

if [ $? -eq 0 ]; then
  echo "File exists ✅"
else
  echo "File does not exist ❌"
fi

echo "----------------------------------"

# =========================================
# 3. Input validation + exit
# =========================================
echo "3. Checking user input"

if [ -z "$1" ]; then
  echo "❌ Error: No argument provided"
  echo "Usage: ./error_handling.sh filename"
  exit 1
fi

echo "Argument received: $1"

echo "----------------------------------"

# =========================================
# 4. File existence check (safe way)
# =========================================
echo "4. Checking file safely"

if [ -f "$1" ]; then
  echo "✅ File exists"
else
  echo "❌ File not found"
fi

echo "----------------------------------"

# =========================================
# 5. set -e (auto stop on error)
# =========================================
echo "5. set -e demo"

set -e   # agar error aaya to script ruk jayega

echo "Running command..."
ls wrongfile   # yaha script stop ho jayegi

echo "This line will NOT execute"

echo "----------------------------------"

# =========================================
# 6. set -x (debugging)
# =========================================
echo "6. Debug mode ON"

set -x

echo "Debug example running"

set +x   # debug off

echo "----------------------------------"

# =========================================
# 7. trap (catch error)
# =========================================
echo "7. Trap example"

trap 'echo "❌ Error caught using trap!"' ERR

ls anotherwrongfile

echo "----------------------------------"

# =========================================
# 8. Function-based error handling
# =========================================
echo "8. Function error handling"

check_error() {
  if [ $? -ne 0 ]; then
    echo "❌ Error in: $1"
    exit 1
  else
    echo "✅ $1 successful"
  fi
}

echo "Trying safe command..."
ls
check_error "ls command"

echo "----------------------------------"

# =========================================
# 9. Real DevOps Example
# =========================================
echo "9. Real DevOps Example"

package=$2

if [ -z "$package" ]; then
  echo "❌ No package provided"
else
  echo "Installing $package..."
  sudo apt install -y $package

  if [ $? -eq 0 ]; then
    echo "✅ $package installed successfully"
  else
    echo "❌ Installation failed"
  fi
fi

echo "----------------------------------"

# =========================================
# END
# =========================================
echo "===== SCRIPT END ====="
