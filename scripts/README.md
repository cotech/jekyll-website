# Scripts

This directory contains scripts for migrating data from wordpress to jekyll.

It relies on a local mirror of the [archived CoTech website](https://coops.tech.archived.website/) which you can create by running

    mkdir mirror
    cd mirror
    httrack https://coops.tech.archived.website/

`httrack` is available via `homebrew` on MacOS.

You then need to install dependencies from rubygems by running

    bundle install

## Creating data files in `_coops`

    ruby migrate_coop_pages.rb
