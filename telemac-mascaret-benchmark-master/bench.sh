#!/usr/bin/env bash

function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  (( $D > 0 )) && printf '%d jour(s) ' $D
  (( $H > 0 )) && printf '%d heure(s) ' $H
  (( $M > 0 )) && printf '%d minute(s) ' $M
  (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
  printf '%d seconde(s)\n' $S
}

WORK_DONE=$(config.py | grep 'My work is done' | wc -l)
if [[ $WORK_DONE -ne 1 ]]; then
    echo "Telemac n'est pas configuré!\nFin"
    exit 1
fi

NBTOTPROC=$(nproc)

CARAC=$(lscpu)

ROOT_FOLDER="$PWD"
MODELES_FOLDER="${ROOT_FOLDER}/modeles"

echo "$CARAC"
echo "$CARAC" >> "${ROOT_FOLDER}/${HOSTNAME}_cpu_carac.log"
echo "Model,NPROC,Time" >> "${ROOT_FOLDER}/${HOSTNAME}_results.csv"

declare -a MODELES_LIST=("malpasset" "18F111_Tisseo" "19F032_Blagnac" "19F105_G6" "19F219_Baise" "21F010_Oloron" "17F158_Badaillac" "19F046_Lorgues" "20F082_Agly")

echo "Démarrage..."

for MODELE in ${MODELES_LIST[@]}
do
    cd "${MODELES_FOLDER}/${MODELE}"
    echo "${MODELE}"
    for NBPROC in $(seq 0 2 ${NBTOTPROC})
    do
        SECONDS=0
        telemac2d.py Q100.cas --ncsize=${NBPROC} >> "${ROOT_FOLDER}/${HOSTNAME}_telemac.log" 2>&1
        duration=$SECONDS
        WORK_DONE=$(tail -n 200 ${ROOT_FOLDER}/${HOSTNAME}_telemac.log | grep 'My work is done' | wc -l)
        ERROR=$(tail -n 10 ${ROOT_FOLDER}/${HOSTNAME}_telemac.log | grep 'TelemacException' | wc -l)
        if [[ $WORK_DONE -ne 1 || $ERROR -eq 1 ]]; then
            echo "${NBPROC} cpu(s) : FAIL!"
            echo "${MODELE},${NBPROC},FAIL" >> "${ROOT_FOLDER}/${HOSTNAME}_results.csv"
            continue
        fi
        rm *.res
        echo "${NBPROC} cpu(s) : $(displaytime ${duration})"
        echo "${MODELE},${NBPROC},${duration}" >> "${ROOT_FOLDER}/${HOSTNAME}_results.csv"
    done
done
