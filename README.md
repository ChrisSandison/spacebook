# Project for CSC300

# TODO IMMEDIATE:
* site logo isn't show up - problem with compiled asset since it works locally
* header menu isn't displaying at minimized mobile size
* spacing on site footer - get rid of overlap

# TODO LATER
* full breadcrumbs for spaces/provinces
* implement user model - use gem Divise to pull user info from other sources
* event links - link to facebook events or other type
* implement moderator level user
* email confirmation system when entering contact email - have contact agree to receive emails from us. This will require user email log model to be examined before sending.
* photo gallery - look into gem Paperclip and upgrade heroku storage
* custom heroku domain name - requires $$$

# How To Run Locally
* download or checkout repository
* ensure rvm is installed and you have run `rvm use ruby-2.0.0-...` whatever patch you may be on
* `bundle install`
* `bundle exec rake db:migrate`
* There are a couple rake tasks used for populating the regions table that are necessary in order to get all provinces (and eventually states) built for the application so run, since all regions in other models reference the region model through region and country codes:
* `rake one_timers:seed_regions`
* `rake one_timers:add_region_name`
* start with `rails s` or `foreman s` or whatever runner you may use (foreman may be overkill, no delayed job runs in this app so far)

# License

Spacebook is an application for rating, reviewing, locating and contacting DIY Spaces, created for educational purposes (U of T CSC300: Project 2 Option 4)
Copyright (C) 2014 Chris Sandison

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see [http://www.gnu.org/licenses]