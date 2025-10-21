loaded all eml files in an [online EML reader](https://www.emlreader.com/) 

the email from 06/10/2025, 18:50:42 seems to be related to the payment not going through mentioned in the challenge. 

looking closely, the link is going to 
`https://evergatetltle.netlify.app/` as opposed to 
`https://evergatetitle.netlify.app/`

go on the bogus website, initiate a transfer, input any data and retreive a [base64 encoded value](https://cyberchef.formality.de/#recipe=From_Base64('A-Za-z0-9%2B/%3D',true,false)&input=YUhSMGNITTZMeTl1TUhSeWRYTjBlQzFpYkc5bkxtNWxkR3hwWm5rdVlYQndMdz09) that gives us the first flag `N0TrustX` and sends us to [a blog](https://n0trustx-blog.netlify.app/)

the bottom link redirects to github, where there is only one repo with a [pretty obvious encoded value](https://github.com/N0TrustX/Spectre/blob/main/spectre.html#L122) which turns out to be [the flag](https://cyberchef.formality.de/#recipe=From_Base64('A-Za-z0-9%2B/%3D',true,false)&input=Wm14aFozdHJiREY2YTJ4cWFUSmtlV054WldScU5tVm1Obmx0YkhKelpqRTRNR1F3Wm4wPQ)