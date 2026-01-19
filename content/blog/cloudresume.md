+++
title = "I tried the Cloud Resume Challenge."
date = "2025-08-11"
author = "Amanda Parada"
tags = [""]
+++



## And I finished it, as of 1/19/2026!

So, when I first took a jab at this challenge back in 2025, I kind of gave up around Chunk 4, which is where you were supposed to apply some sort of automation to your website updates. I was a bit daunted by GitHub at the time, but while I was working on an unrelated project, I decided to take some time to learn that and the Git workflow, and it makes updating my website pretty easy. I settled for a GitHub Actions workflow to have Hugo automatically build my site, and a VSCode extension called GitDoc that'll automatically push my changes once I save the document. So, I guess you can say I unintentially implemented Chunk 4 in my own little way.

Unfortunately, my AWS free tier was running out, so I had to move everything from the S3 bucket I had, to GitHub Pages. That also means I can't implement the visitor counter I had anymore... so that's gone for the time being.

I also took the Solutions Architect Associate exam yesterday, and passed it with a score of 792! That test was *brutal*, and I was struggling to answer a lot of the questions on it. I'm thinking about getting a third certification in the future... but I'll need to take a break for studying for these exams. They take a lot of energy out of me!

I'm still leaving what I wrote down below just for reference.

---

## Original attempt of the challenge back in August 2025

There's a challenge going around called the Cloud Resume Challenge that you can find [here](https://cloudresumechallenge.dev/), so I took a crack at it.

## chunk 0 - the cloud certificate

It took me a month to practice for my AWS CCP exam, mostly using the time I had during my internship. I also was able to work hands-on a bit with AWS, which helped. I passed with an 837 so I must've known *something*... lol. I mostly struggled with the billing questions and the support team ones, because they all blended together for me.

I'm not going to stop at there, though, I want to get another AWS certificate before I graduate. I need to put that 50% voucher to good use!


## chunk 1 - HTML + CSS, setting up CloudFront

Usually, I'm pretty lazy with my HTML and just copy and paste the same page over and over, but to make my life easier, I decided to use a static site generator. On my original old site, I used to use 11ty, but it was pretty easy to get disorganized, so I tried using Pelican, but it didn't really click with me. I settled with Hugo, and I'm satisfied with it so far.

I didn't have to set up the domain name since I already bought mine through another registrar, and I did raise an eyebrow on the idea of using CloudFront, but I was open to it. Actually, the S3 static site was something new to me. Usually, I would just rent a VPS, spin up a basic instance of nginx, and automatically renew my SSL certificate via certbot, but to keep true to the challenge, I tried to keep things within AWS (except for my domain, because I already had paid for it). CloudFront wasn't really that hard to set up, so I'm happy with how my website turned out.

Only complaint I have with CloudFront is that the caching means it takes forever for my website to reflect its changes. I've tried several things to speed it up, but nothing. I'll figure it out later, it's not like I plan to update my website that much.

The only modification I did was to enable DNSSEC for my domain, which was... a click of a button, lol.

## chunk 2 and 3 - lambda function and API gateway

The API implementation and getting the permissions for Lambda to access my DynamoDB database was pretty easy. But I noticed I was forgetting a lot when it came to the Python coding.... coding isn't really my strong suit as I mostly work with hosting and managing Linux servers.  With Javascript, I kinda just plucked it into my index.md file through Hugo and hoped for the best. (at least it works, even if it looks a bit ugly underneath the surface)

I wanted to implement a unique visitor counter, but that involved storing cookies and IP addresses which seemed a bit out of scope consdering how new I am to this stuff. It's also susceptible to being inaccurate if many bots visit my website at the same time, so I tried to implement a rate-limit to the API (which I'm not sure if it works, but I tried). Eh. I don't feel like paying for a WAF right now, so I'll leave it be. If my website was running on a VPS, I could implement Anubis to prevent bots from scraping my site.

## chunk 4 - automation, and technically where I gave up

yeah I was clueless on this section. Terraform seemed pretty daunting, so I kinda left it here. 

I mean, I kinda do some automation already, with my makefile... but nothing crazy. I just use the makefile to automatically have Hugo build my site from the terminal, and sync to my S3 bucket. I used to manually transfer my files with FTP which... I wouldn't recommend.


## (technically) chunk 5 - what now?

I don't think that the CRC works for me, personally. It may work for someone with prior experience, which I don't really have, lol, but for me... I felt pretty overwhelmed. I might give Learn to Cloud a spin and see if I can build up the fundamentals from there (it also teaches you Terraform and Python in more detail), and then try chunk 4 of the CRC.

But hey, at least I learned *something* from this, so it wasn't a complete waste of my time.