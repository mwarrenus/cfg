#!/usr/bin/env bash
# https://unix.stackexchange.com/questions/44040/a-standard-tool-to-convert-a-byte-count-into-human-kib-mib-etc-like-du-ls1
bytesToHuman() {
    b=${1:-0}; d=''; s=0; S=(Bytes {K,M,G,T,P,E,Z,Y}iB)
    while ((b > 1024)); do
	# d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
	printf -v d ".%02d" "$((b % 1024 * 100 / 1024))"
        b=$((b / 1024))
        let s++
    done
    echo "$b$d ${S[$s]}"
}

if [[ ${#@} -eq 1 ]]; then
    bytesToHuman $1;
else
    echo "Usage: $(basename $0) [bytes]"
fi
