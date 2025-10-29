inside the zip is a powershell script clearly containing a 10MB payload on line 18

use the modified [make-stage2.ps1](day23/make-stage2.ps1) script and leverage the already written powershell code to prevent execution of the final payload and leave temporary zip file and extract in a local directory

grep for `flag` in the extracted files for an easy win

```
❯ grep -i flag stage2-2.zip/download/*
stage2-2.zip/download/CLIENT32.ini:Flag=ZmxhZ3tiNmU1NGQwYTBhNWYyMjkyNTg5YzM4NTJmMTkzMDg5MX0NCg==
```