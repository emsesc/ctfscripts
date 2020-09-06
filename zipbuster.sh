#!/bin/bash
# Usage: zipbuster.sh stegofile wordlist
# Needs 7z installed

zipfile=$1;
wordlist=$2;

printf "Zipfile Bruteforce (c) 2020 by Emily Chen\n";

for passphrase in $(cat $wordlist); do 
  response=$(7z t -p$passphrase $zipfile 2>&1);
  if [[ ! $response == *"ERROR: Wrong password"* ]]; then
    printf "[+] Information obtained with passphrase: '%s'\n" "$passphrase";
    printf "%s\n\n" "$response";
    exit
  fi
done
