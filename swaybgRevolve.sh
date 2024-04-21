#!/bin/bash

swayScriptsTmpDir="/tmp/swayScriptsTmpDir"
[ -d "${swayScriptsTmpDir}" ] || { mkdir ${swayScriptsTmpDir}; chmod 770 ${swayScriptsTmpDir}; }

shuffleOrdinalFile="${swayScriptsTmpDir}/swayWallpaperOrdinal.txt"
[ -f "${shuffleOrdinalFile}" ] || { touch "${shuffleOrdinalFile}"; chmod 660 "${shuffleOrdinalFile}"; }

wallpaperDir="${HOME}/Wallpapers/SwayBG"
wallpaperTotalCount=$(($(ls -1q ${wallpaperDir}/*.{jpeg,jpg,png} | wc -l) - 1))
wallpapersArray=($(ls -1q ${wallpaperDir}/*.{jpeg,jpg,png} | sort))
wallpaperOrdinal="$(cat ${shuffleOrdinalFile})"

printHelp_() {
  echo "Usage:
  $(basename "${0}") [OPTION]
  -u  Revolve wallpapers up
  -d  Revolve wallpapers down"    
}

case ${1} in
  -u) pkill '^swaybg$';
      wallpaperOrdinalUp=$((wallpaperOrdinal + 1));
      if [[ "${wallpaperOrdinal}" -lt ${wallpaperTotalCount} ]]; then
	swaybg -i "${wallpapersArray[${wallpaperOrdinalUp}]}" -m fill &>/dev/null &
	echo "${wallpaperOrdinalUp}" > "${shuffleOrdinalFile}"
      else
	swaybg -i "${wallpapersArray[0]}" -m fill &>/dev/null &
	echo "0" > "${shuffleOrdinalFile}"
      fi;;
  -d) pkill '^swaybg$';
      wallpaperOrdinalDown=$((wallpaperOrdinal - 1));
      if [[ "${wallpaperOrdinal}" -gt 0 ]]; then
	swaybg -i "${wallpapersArray[${wallpaperOrdinalDown}]}" -m fill &>/dev/null &
	echo "${wallpaperOrdinalDown}" > "${shuffleOrdinalFile}"
      else
	swaybg -i "${wallpapersArray[${wallpaperTotalCount}]}" -m fill &>/dev/null &
	echo "${wallpaperTotalCount}" > "${shuffleOrdinalFile}"
      fi;;
  *) printHelp_; exit;;
esac	
	



