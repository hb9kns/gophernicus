# Convert filetypes.conf to filetypes.h.

BEGIN {
    print "#define FILETYPES \\"
}
/^[^#]/ {
    printf "\t"
    for (i = 2; i <= NF; ++i) {
	printf "\"%s\", \"%s\", ", $i, $1
    }
    printf " \\\n"
}
END {
    printf "\tNULL, NULL\n"
}
