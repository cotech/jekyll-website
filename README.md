# CoTech Website

This repo is [hosted at git.coop](https://git.coop/cotech/website) and [push mirrored to GitHub](https://github.com/cotech/jekyll-website).

If you would like to contribute to this repo you have two options:

1. [Join Webarchitects](https://webarch.coop/join) to [create an account at git.coop](https://webarch.coop/git#free) and then request access to the [CoTech group](https://git.coop/cotech) and when that has been grated you can update this repo directly.
2. Use a GitHub account to create a [pull request](https://github.com/cotech/jekyll-website/pulls) at GitHub and then ask someone who is a member of [Webarchitects](https://www.webarchitects.coop/) to [patch the repo for you](https://community.coops.tech/t/cotech-website-repo-mirroring-to-github/2818).

## Introduction

This is a port of the old WordPress version of the CoTech website to a statically-generated site using Jekyll. The site consists of a bunch of markdown files and images stored in git.coop. The Jekyll build process is automated so that there is no need to have Jekyll installed and running to make changes to the site.

  * Live site: https://coops.tech/
  * Dev site: https://dev.coops.tech/

## Updating the site

It is possible to edit markdown files and upload images through the [GitLab Web IDE](https://docs.gitlab.com/ce/user/project/web_ide/). To use this, got to the [GitLab website page](https://git.coop/cotech/website) and click the Web IDE button to the left below the toolbar.

Each page type lives in it's own folder.

  * _clients contains client pages
  * _coops contains coop pages
  * _services contains service pages
  * _technologies contains technology pages

To change a coop page, edit the relevant coop file in the _coops directory. Each file contains a metadata block at the top of the file, followed by the main text describing the coop. The metadata block contains the coop details and lists of clients, services and technologies associated with the coop.

If using GitLab Web IDE, make your changes to the relevant files and then commit your changes by clicking the commit button in the bottom-left corner. Add a brief description of the changes you have made as a the commit message and then click 'Stage & Commit'. It is okay to commit to the master git branch if you are simply updating your coop details, but if you are making extensive changes to many coop pages it is better to create a new branch and merge request and ask someone else to review your changes before they merge your changes in the master branch.

Once your changes have been committed to the master branch an automatic build of the dev site is triggered. This will take a few minutes to run and you can check the status of the build here: https://git.coop/cotech/website/pipelines. Once the build has completed you will be able to see your changes on the dev site: https://dev.coops.tech/.

If you're happy with they changes on the dev site, then you can deploy them to the live site. See the Deployment section below on how to do this.

### Adding new clients, services and technologies

You will need to add a new markdown file in the relevant directory for the new item. The file only needs to contain a metadata block with the details describing the new item, this is typically just a title and name (which are usually the same), but look at other items for examples.

Along with the new file you will also need to upload a logo or image for the new item. Images live in a sub-directory of the images directory and should be named the same as the markdown file, but with a .png extension. Images should be formatted as a PNG and optimized for the web.

Once the new file and image have been created then you can add the new client, service or technology as a list item in the metadata section of the relevant coop file.

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

    # run some ruby/bundler commands
    docker-compose run jekyll bundle --version
    docker-compose run jekyll bundle update
    docker-compose run jekyll bundle exec jekyll --help

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

### Dev/Staging

When changes are committed to the `master` branch the `.gitlab-ci.yml` file triggers the building of the site and then the copying of the results to [dev.coops.tech](https://dev.coops.tech).

### Production

You need to manually deploy the changes from dev to production.

1. View the changes on [dev.coops.tech](https://dev.coops.tech) and ensure you're happy for them to be pushed to production.

2. Visit [GitLab environments](https://git.coop/cotech/website/environments). __NOTE.__ If you don't have access to the environments page then post a message in the [Website category of the CoTech forum](https://community.coops.tech/c/cotech/website) to ask someone to do it for you.

3. Click the "Play" icon on the right of the screen in the row for the "dev" environment and choose "deploy:production".

4. Your changes will be visible in production when the commit listed in the "production" environment row matches the commit listed in the "dev" environment row.

## Contributing

There's a [list of bugs and improvements](https://git.coop/cotech/website/issues) in the repository. Feel free to add more, discuss or claim any of these issues to work on.

[CoTech Website]: https://www.coops.tech/
[Jekyll]: https://jekyllrb.com/
