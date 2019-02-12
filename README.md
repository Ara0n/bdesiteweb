# bdesiteweb
The repo for the web site for our BDE in the IUT Lyon 1 in informatics for the year 2019

# folder organization
- `src`: where the documents used to build the website
    - `pages`: the .html pages
    - `styles`: the .less style sheets of the website
    - `assets`: all the different images and docs used for website

# building the website
`make [OUTDIR=<destination>]` will build everything that is either out of date or missing directly into the destination directory. The default destination is `out/`.

`make regenerate [OUTDIR=<destination>]` will rebuild everything.

# accessing the website
The website is accessible at http://bde-infossible.tk and see the repo https://github.com/natnat-mc/kfet for the kfet part which is hosted at http://kfet.bde-infossible.tk