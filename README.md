# Docker-phpADNSite

This is a Docker container for running [phpADNSite](https://github.com/LukasRos/phpADNSite), based on [Docker-PHPAppBase](https://github.com/Jadoos/Docker-PHPAppBase).

You need to specify your App.net username and an App.net access token as parameters when running the container. The [phpADNSite documentation](https://github.com/LukasRos/phpADNSite) contains more information about generating an appropriate access token as well as further background information.

Your site will launch with the *bootstrap-default* theme. If you want to use a different theme, specify the `THEME` environment variable when running the container. All phpADNSite plugins that are part of the default distribution are enabled in this Docker image.

Usage:

    docker run -d -p 80:80 lukasros/phpadnsite {username} {accessToken}


Like it?! If you want to say thanks, why not flattr me? :)

[![Flattr this](https://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/thing/3725248/LukasRosphpADNSite-on-GitHub)
