# CoTech Website

## Introduction

This is a port of the current Wordpress version of the [CoTech Website][] to a statically-generated site using [Jekyll][].

## Run the site locally

You can run the site on your computer as if it were live online using Jekyll. You will need `git` and `ruby` installed on your machine to do this. Then clone the repository

    git clone git@git.coop:cotech/website.git

Install the dependencies for the project

    cd website
    gem install bundler
    bundle install

Run a local web server so that you can view the site

    bundle exec jekyll server

And visit [localhost:4000](http://localhost:4000) to view the site.

## Deploy CI

When changes are committed the `.gitlab-ci.yml` file triggers the building of the site and then the copying of the results to https://static.coops.tech/

## Contributing

There's a [list of bugs and improvements](https://git.coop/cotech/website/issues) in the repository. Feel free to add more, discuss or claim any of these issues to work on.

[CoTech Website]: https://www.coops.tech/
[Jekyll]: https://jekyllrb.com/
