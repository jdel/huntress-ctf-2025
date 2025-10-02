# Clean up

Remove comments

Replace regex in VSCode

```
(\$[a-zA-Z]{5} = .*\n){3}Write-Host \$[a-zA-Z]{5}\n
```

Some more manual cleaning up in code path to remove bloat to generate

[spaghetti-clean.ps1](spaghetti-clean.ps1)

Comment out the execution of payload to write it to files instead to generate

  - [MAIN_FILE_AMIGO](MAIN_FILE_AMIGO)
  - [MyOasis4-decoded.ps1](MyOasis4-decoded.ps1)
  - [TDefo-decoded.ps1](TDefo-decoded.ps1)

# Following allow to extract the flags
## MAIN_FILE_AMIGO
Uncover the flag within the "main file"

  * The main file content is from the `MAIN_FILE_AMIGO` extraction. Which content a  sequence of raw byte values in decimal.
  * Converting it to binary file then using hexdump reveals the flags
```
    cat > bytes.txt <<'EOF'
    77 90 144 0 3 0 0 0 4 0 0 0 255 255 0 0 184 0 0 0 0 0 0 ....
    EOF

    python3 - <<'EOF'
    import sys
    nums = open('bytes.txt').read().strip().split()
    b = bytes(int(x) for x in nums)
    open('suspect.bin','wb').write(b)
    print("wrote", len(b), "bytes to suspect.bin")
    EOF

    file suspect.bin
    hexdump -C suspect.bin 

    flag{39544d3b5374ebf7d39b8c260fc4afd8}
```

https://cyberchef.formality.de/#recipe=Strings('Single%20byte',4,'Alphanumeric%20%2B%20punctuation%20(A)',false,false,false)Regular_expression('User%20defined','flag%7B.*%7D',true,true,false,false,false,false,'List%20matches')&ienc=65001

## MyOasis4-decoded
Uncover the flag within "my fourth oasis."

Had to decode from `MyOasis4-decode`

```
Got decoded the 
`# $XPYMWR = [ZQCUW]::GetProcAddress($BBWHVWQ, "$([systeM.neT.webUtility]::HtMldECoDE('&#102;&#108;&#97;&#103;&#123;&#98;&#51;&#49;&#51;&#55;&#57;&#52;&#100;&#99;&#101;&#102;&#51;&#51;&#53;&#100;&#97;&#54;&#50;&#48;&#54;&#100;&#53;&#52;&#97;&#102;&#56;&#49;&#98;&#54;&#50;&#48;&#51;&#125;'))")`
flag{b313794dcef335da6206d54af81b6203}
```

https://cyberchef.formality.de/#recipe=From_HTML_Entity()&input=JiMxMDI7JiMxMDg7JiM5NzsmIzEwMzsmIzEyMzsmIzk4OyYjNTE7JiM0OTsmIzUxOyYjNTU7JiM1NzsmIzUyOyYjMTAwOyYjOTk7JiMxMDE7JiMxMDI7JiM1MTsmIzUxOyYjNTM7JiMxMDA7JiM5NzsmIzU0OyYjNTA7JiM0ODsmIzU0OyYjMTAwOyYjNTM7JiM1MjsmIzk3OyYjMTAyOyYjNTY7JiM0OTsmIzk4OyYjNTQ7JiM1MDsmIzQ4OyYjNTE7JiMxMjU7&ienc=65001
## TDefo-decoded
Uncover the flag beside "MEMEMAN."

Flag inside `TDefo-decoded`. Just a simple CTRL + F can reveal it

`# Add-MpPreference -ExclusionExtension "flag{60814731f508781b9a5f8636c817af9d}"`
