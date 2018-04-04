Build
------

The project uses one external library with Carthage dependency manger so in order to build the project the following command
needs to be executed: `carthage update --platform ios`. The instruction how Carthage can be setup can be found here
https://github.com/Carthage/Carthage
After that application should be built with Xcode in an useal way.


Application Arhitecture
--------------------------

This application is build with the SOLID arhitecture in mind and using modified version of VIPER. There are 2 VIPER modules:
Search and Details. It's a bit of an overhead for the application of this size but it can be easily tested, extended and changed.


Notes
--------

I spent at least half of the time trying to get my head around Twitter API. Firstly the link that is given in the task lands you on the
whole twitter API index page which doesn't make it clear which API needs to be used for search. The search API has few tires
and it also not quite clear if the credentials that are given are from free or premium tier.
The next thing is that  the only way to get images URLs back via API was to use `tweet_mode=extended` which I found on
twitter development forum but not in the documentation.

The point I am trying to make is that if had 3 hours to complete this task I would have no chance. Mostly because of the
unfamiliar API and lack mode detailed API description in the task.


