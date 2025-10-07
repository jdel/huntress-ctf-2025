probably not the intended answer but hey... i got the flag...

download `RunAsTI.exe` https://github.com/mbcdev/RunAsTrustedInstaller/releases/tag/release-0.2

base64encode it and copy paste it to the windows vm

in powershell:

```powershell
$b64runasti = "<PASTE B64 HERE>"
[IO.File]::WriteAllBytes('c:\ctf\runasti.exe', [Convert]::FromBase64String($b64runasti))
```

now in a administrator `cmd` prompt, run:

```
C:\ctf\runasti.exe C:\Users\Administrator\Desktop\TrustMe.exe
```
