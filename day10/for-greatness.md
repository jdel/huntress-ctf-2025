i de-obfuscated the original code by renaming variables and following the `goto` into [stage1.php](stage1.php)

the `$part2` variable is a decimal encoded string, using an online php interpreter, i printed it out to reveal a base64 string

i run the  file in [Cyberchef](https://cyberchef.formality.de/#recipe=From_Base64('A-Za-z0-9%2B/%3D',true,false)Zlib_Inflate(0,0,'Adaptive',false,false)) base64 decode and zlib inflate to reveal [stage3.php](stage3.php)

stage3 contains another base64 encoded string that reveals [stage4.php](stage4.php) 

looking closer you will find the `mailto` function that contains the flag in the email address that needs to be reversed to reveal the final flag
