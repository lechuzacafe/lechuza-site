+++
author = "Amanda Parada"
title = "Optimizing my workflow"
date = "2025-12-25"
tags = []

+++

I kind of forgot today was Christmas because I spent a big chunk of my time today trying to organize my workflow on Visual Studio Code. I noticed that I didn't really feel that motivated to work on my servers, or write to my blog... because it's a massive pain to manually update things the "old-fashioned" way. I would work on the .md files for Hugo on my desktop computer, and manually upload it to my S3 bucket when I was done, which lead me to uploading files and folders that probably shouldn't of been seen. Oops.

I did write a small, basic Makefile that ran some basic AWS CLI commands when executed, but I had to manually open up the terminal and it was pretty annoying. So I took some time to fix my setup a bit. Here's what my makefile looks like, if you're curious.

```
BUCKET_NAME = mycoolbucket

build:
	hugo

deploy: build
	aws --profile hugo-deploy s3 sync public/ s3://$(BUCKET_NAME) --delete
	aws --profile hugo-deploy s3 website s3://$(BUCKET_NAME) --index-document index.html --error-document 404.html
```

I added a separate hugo-deploy profile that carried my AWS credentials to keep things a bit cleaner.

## What I did for my portfolio site
I didn't really make changes to that makefile, but I did experiment with a VSCode extension called Run on Save. It took me a while to find a good way to run it... ultimately, I just ended up writing what I needed to my workspace file (which loads up all of the websites I am working on for me).

```
{
  "folders": [
    {
      "path": "."
    }
  ],
  "settings": {
    "runOnSave.commands": [
      {
        "match": "lechuza.cafe/.*",
        "command": "cd lechuza.cafe && make deploy",
        "runIn": "backend"
      }
    ]
  }
}
```
So, whenever I hit Ctrl+S, my Hugo site is automatically built and deployed to my S3 bucket... yay.

## Other things of note
Most of my effort today was focused on my more "fun", personal website though. I'm currently running another website on a DigitalOcean droplet running Nginx, and I used to use rsync... after I edited and saved my files with nano. More efficient than manually ftping the files back and forth (egh), but still kind of annoying. Thankfully, there's an sftp extension for VSCode as well, where it automatically syncs my files to my droplet when I save in VSCode. It's really snappy and efficient. Here's my sftp.json file.

```
[
  {
  "name": "HTTP",
  "context": "myfunsite/http",
  "host": "myserverip",
  "protocol": "sftp",
  "port": nonstandardport,
  "username": "mycooluser",
  "remotePath": "/var/www/myfunsite.com/",  
  "uploadOnSave": true, 
  "watcher": {
    "files": "**/*",  
    "autoUpload": true,
    "autoDelete": true  
  },
  "ignore": [".git", ".vscode"], 
  "privateKeyPath": "/home/mycoolfiles/.ssh/httpprivatekey"
},
  {
  "name": "Gemini",
  "context": "myfunsite/gemini",
  "host": "myserverip",
  "protocol": "sftp",
  "port": nonstandardport,
  "username": "mygeminiuser",
  "remotePath": "/home/mygeminiuser/gemini/content/",  
  "uploadOnSave": true,
  "watcher": {
    "files": "**/*",
    "autoUpload": true,
    "autoDelete": true 
  },
  "ignore": [".git", ".vscode"],
  "privateKeyPath": "/home/mycoolfiles/.ssh/geminiprivatekey"
}
]
```
What makes this really cool to me, is that I can configure sftp to seamlessly sync for two different directories. I have two separate directories for the HTTP side of my "fun" website, and the Gemini protocol side.

I also installed an extension called Live Server that boots up my web browser to share a live local server version of my pages, so I can edit on the fly... although sftp is fast enough that I can probably keep my site in another window.

## What do I want to do next?
I want to save a basic markdown snippet in VSCode, so every time I go to write a new blog post, I don't have to copy and paste from my old ones.
Additionally... I don't really want to work with AWS anymore for my static site, so I might change hosts relatively soon. Github Pages catches my eye, but I haven't decided where to move my site to as of this moment.