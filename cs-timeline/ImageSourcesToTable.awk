# assumes format is 
# year:label:info
# Output is LaTex longtable
# Assumes Tstrut is defined in the document

BEGIN {
	FS = ":"

	printf("\\begin{longtable}[H]{p{.4in}|p{.8in}|p{3in}}\n")
	printf("\\caption{Image Sources}\\\\\n")
	printf("\\textbf{Year} & textbf{Item} & \\textbf{Source}\\\\\n")
	printf("\\hline\n")
	printf("\\endfirsthead\n")
	printf("\\textbf{Year} & textbf{Item} & \\textbf{Source}\\\\\n")
	printf("\\endhead\n")

}

{
	# Filter out blank lines or badly formatted lines
	if (NF > 2) {
		printf("\\Tstrut %s & ", $1);
		printf("%s & ", $2);
		source = $3
		for (x = 4;x <= NF;++x) {
			source = source":"$x
		}

		# Have to process backslash first to prevent encoding later entries
		gsub("[\\\\]", "\\textbackslash ", source)

		# Force break if no space or hyphen after 45 characters
		split(source, chars, "")
		max_len = 45
		last_break_char = 0
		new_source = ""
		for (c=1; c <= length(source); c++) {
			if (chars[c] == " " || chars[c] == "-") {
				last_break_char = 0
			} else {
				++last_break_char
				if (last_break_char > max_len) {
					new_source = new_source"\\newline "
					last_break_char = 0
				}
			}
			new_source = new_source""chars[c]
		}
		
		source = new_source
		
		# Deal with characters problematic in LaTex
		# & % $ # _ { } ~ ^ \ (backslash was handled earlier)
		gsub("[&]", "\\&", source)
		gsub("[%]", "\\%", source)
		gsub("[$]", "\\$", source)
		gsub("[#]", "\\#", source)
		gsub("[_]", "\\_", source)
		gsub("[{]", "\\{", source)
		gsub("[}]", "\\}", source)
		gsub("[~]", "\\textasciitilde", source)
		gsub("[\\^]", "\\textasciicircum", source)
		
		printf("%s\\\\\n", source)
		printf("\\hline\n");
	}
}

END {
	# bottomrule not needed - leads to extra line in table
	# printf("\\bottomrule\n");
	printf("\\end{longtable}\n");
}
