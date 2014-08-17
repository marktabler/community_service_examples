# Community Service: Example Services

## Overview

This is a set of services based on the Community Service gem for service
discovery and communication.  Though they are called "Example" services, many
of them could be taken as-is and dropped in to production, though it is likely
that you will end up wanting to customize them down the road.  Others, such as
the ThingService, are simply meant to illustrate common service patterns (in
that case, a simple CRUD service).

## Services

* **UserService** - Provides a basic User model.  NOT YET IMPLEMENTED
* **LoginService** - Provides a login page and tracks sessions.  NOT YET
    IMPLEMENTED
* **PermissionService** - Tracks authorization data.  NOT YET IMPLEMENTED, LIKELY
    TO REQUIRE CUSTOMIZATION
* **ThingService** - A simple CRUD-based service.  NOT YET IMPLEMENTED, NOT
    USABLE AS-IS
* **BillingService** - A more complex service with a local User model, several
    resources, and moderately complex permissions.  NOT YET IMPLEMENTED, NOT
    USABLE AS-IS

## Creating A New Service

There's a Rails template in this directory which all the example services were
built with. That said, as long as your services expose the correct API and are
acceptably performant, it doesn't really matter what the internal
implementations look like.  Heck, write 'em in Java if you want (or, more
likely, if you need the performance).

## Running All The Services

### Locally on your machine

TODO: There should be a way to do this -- probably a script in the base
directory?

### For reals, in production

That's up to you!  It really depends on your individual setup; there probably
isn't a sane way to create a generic deploy strategy here.  If you need a hand
with this, you might want to get a more experienced friend (or hire a
consultant) to help you out.
