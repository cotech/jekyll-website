# CoTech Website

## Introduction

This is a port of the current Wordpress version of the [CoTech Website][] to a statically-generated site using [Jekyll][].

## Run the site locally

You can run the site on your computer as if it were live online using Jekyll. You will need `git` and `ruby` installed on your machine to do this. Then clone the repository

### ... using docker

Make sure you have [docker](https://docs.docker.com/install/) (CE is fine) installed and running,
and [docker-compose](https://docs.docker.com/compose/install/) installed,
then:

    git clone git@git.coop:cotech/website.git
    cd website
    docker-compose up -d

And visit [localhost:4000](http://localhost:4000) to view the site.

There are two docker volumes used here:
* `vendor` - caches the ruby gems even if you recreate the containers
* `site` - holds the built site files to share them with httpd (and not clutter your local filesystem)

A few useful things you might want to do:

    # check the status of the containers
    docker-compose ps

    # stop all the containers (but don't remove them)
    docker-compose stop

    # stop and remove the containers (but leave the volumes)
    docker-compose down

    # remove everything
    docker-compose down -v

    # bring it back to life from any state you happen to be in
    docker-compose up -d

### ... directly on your machine

Install the dependencies for the project

    git clone git@git.coop:cotech/website.git
    cd website
    gem install bundler
    bundle install

Run a local web server so that you can view the site

    bundle exec jekyll server

And visit [localhost:4000](http://localhost:4000) to view the site.

**Note: not all the images will load as there is no `.htaccess` support locally**

## Deployment

When changes are committed to the `master` branch the `.gitlab-ci.yml` file triggers the building of the site and then the copying of the results to [dev.coops.tech](https://dev.coops.tech).

Once someone has verified that looks ok, you can use the
[GitLab environments](https://git.coop/cotech/website/environments)
to promote it to [www.coops.tech](https://www.coops.tech)

## Contributing

There's a [list of bugs and improvements](https://git.coop/cotech/website/issues) in the repository. Feel free to add more, discuss or claim any of these issues to work on.

[CoTech Website]: https://www.coops.tech/
[Jekyll]: https://jekyllrb.com/
