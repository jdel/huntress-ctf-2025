the files seems to be INFO2 files from windows trash bin

i made a [python script](day11/exploit.py) to parse the INFO2 files according to the binary file structure (source: [JS parsing implementation](https://stackoverflow.com/questions/66939004/windows-recycle-bin-information-file-binary-format)) and used it to print raw hex and interpreted data for each field

by looking at the raw hex data, the `header`, `path_len` and `path` fields are always identical, the data must be hidden in the size and / or the deletion time

first i filtered out every file that has a corresponding data (`$R`) file as these seem to be legit recycle bin files and kept only the fake `$I` files

then i printed only the size for each file and noticed it looks like decimal encoding, which [Cyberchef](https://cyberchef.formality.de/#recipe=From_Decimal('Line%20feed',false)&input=NTAKNDkKNTQKNTMKMTAxCjUwCjUwCjQ5CjU1CjU3CjU2CjEwOAoxMDEKNTMKMTI1CjEwMgo0OQoxMDAKNTUKNDkKNTEKMTAwCjEwMwoxMDAKNTMKNDgKMTAKNTQKNDgKNTMKNTYKOTgKOTcKNTYKOTgKMTAxCjUwCjEwMQoxMjM) clearly confirms that it contains all the ascii characters of a flag, not in the right order

all the `$R` files strongly hint at looking at the deletion time, so i sorted all files by deletion time [after figuring out](https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-filetime) how to treat the encoded data

extract all the files in the same directory as the python script and execute it to reveal the flag