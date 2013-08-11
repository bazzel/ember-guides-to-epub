# Ember Guides to ePUB

## Introduction

This Ruby script generates a single ePUB file for the [Ember.js guides](http://emberjs.com/guides/).
I wrote this script so I can easily read the guides on my Amazon Kindle.

## Requirements


### External Deps

* Pandoc (http://johnmacfarlane.net/pandoc/) for converting markdown to epub

## Installation

    git clone git://github.com/bazzel/ember-guides-to-epub.git
    cd ember-guides-to-epub
    gem install bundler
    bundle install

## More Information

The script will merge all seperate guides from the Ember.js site into one single file. For this, the website repository will be cloned to a temporary folder. Therefore, you need to be connected to the internet.

The script uses [guides.yml](https://github.com/emberjs/website/blob/master/data/guides.yml) for merging the guides in the appropriate order.

## Example Usage

    bundle exec rake ember_guides_to_epub:generate

After you ran this rake task, can will find an updated ePUB in the **output** folder.
