#!/bin/bash

CC=cc
CFLAGS="-Wall -Wextra -Werror"
EXEC="a.out"

if [ $# -eq 0 ]; then
  echo "Usage: $0 <fichier1.c> [fichier2.c fichier3.c ...]"
  exit 1
fi

for fichier_c in "$@"; do
  if [ ! -f "$fichier_c" ]; then
    echo "Le fichier $fichier_c n'existe pas."
  else
    ${CC} ${CFLAGS} "$fichier_c" -o "${EXEC}"

    if [ $? -eq 0 ]; then
      "./${EXEC}"
      rm -f "${EXEC}"
    else
      echo "La compilation de $fichier_c a échoué."
    fi
  fi
done
