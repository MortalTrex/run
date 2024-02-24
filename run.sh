#!/bin/bash

CC=cc
CFLAGS="-Wall -Wextra -Werror"
EXEC="a.out"

if [ $# -eq 0 ]; then
  echo "Usage: $0 <fichier1.c> [fichier2.c fichier3.c ...]"
  exit 1
fi

# Compilation de tous les fichiers .c fournis en entrée
${CC} ${CFLAGS} "$@" -o "${EXEC}"

if [ $? -eq 0 ]; then
  # Exécution du programme compilé
  "./${EXEC}"
  # Suppression du fichier exécutable après l'exécution
  rm -f "${EXEC}"
else
  echo "La compilation a échoué."
fi
