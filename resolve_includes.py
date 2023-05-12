from pathlib import Path

files = set()
prefix = ""
with open("file_list") as f:
	for line in f:
		if line[0] == "@":
			prefix = Path(line[3:]).parent
			files.add(line[3:])
		else:
			files.add((prefix / line).resolve())
with open("to_keep", "w") as f:
	for x in files:
		f.write(str(x))
