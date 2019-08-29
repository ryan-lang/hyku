# Hyku, the Hydra-in-a-Box Repository Application

Code: 
[![Build Status](https://circleci.com/gh/samvera/hyku.svg?style=svg)](https://circleci.com/gh/samvera/hyku)
[![Coverage Status](https://coveralls.io/repos/samvera/hyku/badge.svg?branch=master&service=github)](https://coveralls.io/github/samvera/hyku?branch=master)
[![Stories in Ready](https://img.shields.io/waffle/label/samvera/hyku/ready.svg)](https://waffle.io/samvera/hyku)

Docs: 
[![Documentation](http://img.shields.io/badge/DOCUMENTATION-wiki-blue.svg)](https://github.com/samvera/hyku/wiki)
[![Contribution Guidelines](http://img.shields.io/badge/CONTRIBUTING-Guidelines-blue.svg)](./CONTRIBUTING.md)
[![Apache 2.0 License](http://img.shields.io/badge/APACHE2-license-blue.svg)](./LICENSE)

Jump In: [![Slack Status](http://slack.samvera.org/badge.svg)](http://slack.samvera.org/)

----
## Table of Contents

  * [Running the stack](#running-the-stack)
    * [For development](#for-development)
    * [For testing](#for-testing)
    * [On AWS](#on-aws)
    * [With Docker](#with-docker)
    * [With Vagrant](#with-vagrant)
  * [Switching accounts](#switching-accounts)
  * [Development dependencies](#development-dependencies)
    * [Postgres](#postgres) 
  * [Importing](#importing)
    * [from CSV](#from-csv)
    * [from purl](#from-purl)
  * [Compatibility](#compatibility)
  * [Product Owner](#product-owner)
  * [Help](#help)
  * [Acknowledgments](#acknowledgments)

----

## Running the stack

### For development / testing with Docker

#### Dory

On OS X or Linux we recommend running [Dory](https://github.com/FreedomBen/dory). It acts as a proxy allowing you to access domains locally such as hyku.docker or tenant.hyku.docker, making multitenant development more straightforward and prevents the need to bind ports locally.  You can still run in development via docker with out Dory, but to do so please uncomment the ports section in docker-compose.yml and then find the running application at localhost:3000

```bash
gem install dory
dory up
```

#### Basic steps

```bash
docker-compose up web # web here means you can start and stop Rails w/o starting or stopping other services. `docker-compose stop` when done shuts everything else down.
```

Once that starts (you'll see the line `Passenger core running in multi-application mode.` to indicate a successful boot), you can view your app in a web browser with at either hyku.docker or localhost:3000 (see above)

#### Tests in Docker

The full spec suite can be run in docker locally. There are several ways to do this, but one way is to run the following:

```bash
docker-compose exec web rake
```

### For development

```bash
solr_wrapper
fcrepo_wrapper
postgres -D ./db/postgres
redis-server /usr/local/etc/redis.conf
bin/setup
DISABLE_REDIS_CLUSTER=true bundle exec sidekiq
DISABLE_REDIS_CLUSTER=true bundle exec rails server -b 0.0.0.0
```
### For testing

See the [Hyku Development Guide](https://github.com/samvera/hyku/wiki/Hyku-Development-Guide) for how to run tests.

### Working with Translations

You can log all of the I18n lookups to the Rails logger by setting the I18N_DEBUG environment variable to true. This will add a lot of chatter to the Rails logger (but can be very helpful to zero in on what I18n key you should or could use).

```console
$ I18N_DEBUG=true bin/rails server
```

### On AWS

AWS CloudFormation templates for the Hyku stack are available in a separate repository:

https://github.com/hybox/aws

### With Docker

We distribute two `docker-compose.yml` configuration files.  The first is set up for development / running the specs. The other, `docker-compose.production.yml` is for running the Hyku stack in a production setting. . Once you have [docker](https://docker.com) installed and running, launch the stack using e.g.:

```bash
docker-compose up -d
```

### With Vagrant

The [samvera-vagrant project](https://github.com/samvera-labs/samvera-vagrant) provides another simple way to get started "kicking the tires" of Hyku (and [Hyrax](http://hyr.ax/)), making it easy and quick to spin up Hyku. (Note that this is not for production or production-like installations.) It requires [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/).

## Switching accounts

The recommend way to switch your current session from one account to another is by doing:

```ruby
AccountElevator.switch!('repo.example.com')
```

## Development Dependencies

### Postgres

Hydra-in-a-Box supports multitenancy using the `apartment` gem. `apartment` works best with a postgres database.

## Importing
### from CSV:

```bash
./bin/import_from_csv localhost spec/fixtures/csv/gse_metadata.csv ../hyku-objects
```

### from purl:

```bash
./bin/import_from_purl ../hyku-objects bc390xk2647 bc402fk6835 bc483gc9313
```

## Compatibility

* Ruby 2.4 or the latest 2.3 version is recommended.  Later versions may also work.
* Rails 5 is required. We recommend the latest Rails 5.1 release.

### Product Owner

[orangewolf](https://github.com/orangewolf)

## Help

The Samvera community is here to help. Please see our [support guide](./SUPPORT.md).

## Acknowledgments

This software was developed by the Hydra-in-a-Box Project (DPLA, DuraSpace, and Stanford University) under a grant from IMLS. 

This software is brought to you by the Samvera community.  Learn more at the
[Samvera website](http://samvera.org/).

![Samvera Logo](https://wiki.duraspace.org/download/thumbnails/87459292/samvera-fall-font2-200w.png?version=1&modificationDate=1498550535816&api=v2)
