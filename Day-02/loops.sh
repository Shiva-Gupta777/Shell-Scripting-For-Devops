#!/bin/bash

echo "===== FOR LOOP (Numbers) ====="
for i in {1..5}
do
  echo "Number: $i"
done

echo "----------------------------------"

echo "===== FOR LOOP (Arguments) ====="
for arg in "$@"
do
  echo "Argument: $arg"
done

echo "----------------------------------"

echo "===== WHILE LOOP ====="
i=1
while [ $i -le 5 ]
do
  echo "While value: $i"
  i=$((i+1))
done

echo "----------------------------------"

echo "===== UNTIL LOOP ====="
i=1
until [ $i -gt 5 ]
do
  echo "Until value: $i"
  i=$((i+1))
done

echo "----------------------------------"

echo "===== BREAK EXAMPLE ====="
for i in {1..5}
do
  if [ $i -eq 3 ]; then
    break
  fi
  echo "Break loop: $i"
done

echo "----------------------------------"

echo "===== CONTINUE EXAMPLE ====="
for i in {1..5}
do
  if [ $i -eq 3 ]; then
    continue
  fi
  echo "Continue loop: $i"
done

echo "----------------------------------"

echo "===== DEVOPS EXAMPLE ====="
for pkg in "$@"
do
  echo "Installing package: $pkg"
  # sudo apt install -y $pkg
done

echo "----------------------------------"

echo "===== END ====="
