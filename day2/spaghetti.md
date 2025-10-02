Remove comments

Replace regex in VSCode

```
(\$[a-zA-Z]{5} = .*\n){3}Write-Host \$[a-zA-Z]{5}\n
```

### Following allow to extract the flags
* Uncover the flag within the "main file."
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

* Uncover the flag within "my fourth oasis.

Had to decode from `MyOasis4-decode`
```
Got decoded the 
`# $XPYMWR = [ZQCUW]::GetProcAddress($BBWHVWQ, "$([systeM.neT.webUtility]::HtMldECoDE('&#102;&#108;&#97;&#103;&#123;&#98;&#51;&#49;&#51;&#55;&#57;&#52;&#100;&#99;&#101;&#102;&#51;&#51;&#53;&#100;&#97;&#54;&#50;&#48;&#54;&#100;&#53;&#52;&#97;&#102;&#56;&#49;&#98;&#54;&#50;&#48;&#51;&#125;'))")`
flag{b313794dcef335da6206d54af81b6203}
```

* Uncover the flag beside "MEMEMAN."
Flag inside `TDefo-decoded`. Just a simple CTRL + F can reveal it
`# Add-MpPreference -ExclusionExtension "flag{60814731f508781b9a5f8636c817af9d}"`
