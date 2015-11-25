# Check input
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: docker run lukasros/phpadnsite {username} {accessToken}"
    exit 1
fi

ADN_USERNAME=$1
ADN_ACCESS_TOKEN=$2

# Write configuration file
echo "Writing configuration for $ADN_USERNAME ..."
echo "<?php return array(" \
  " 'domains' => array( " \
  "   '*' => array( " \
  "		 'backend_config' => array( " \
  "		 'username' => '$ADN_USERNAME', " \
  "		 'access_token' => '$ADN_ACCESS_TOKEN' " \
  "	  ), " \
	"	  'theme_config' => array( " \
  "		 'name' => '${THEME=bootstrap-default}', " \
  "		 'variables' => array() " \
  "		), " \
	"		'links' => array(), " \
  "	 ) " \
  "	), " \
  "	'plugins' => array( " \
  "		'PhpADNSite\Plugins\ReplyAndDirectedPostHider', " \
  "		'PhpADNSite\Plugins\LongpostsPlugin', " \
  "		'PhpADNSite\Plugins\OEmbedProcessor', " \
  "		'PhpADNSite\Plugins\WebmentionPlugin', " \
  "		'PhpADNSite\Plugins\ReactionPlugin' " \
  "	), " \
  " 'views' => array( " \
	"	  'PhpADNSite\FilteredViews\TopPostsView', " \
	"	  'PhpADNSite\FilteredViews\LongpostsView' " \
	"), " \
  "	'backend' => array( " \
  "		'class' => 'PhpADNSite\Core\GuzzleAPIClient', " \
  "		'config' => array( " \
  "			'uri' => 'https://api.app.net/' " \
  "		) " \
  "	), " \
  "	'debug' => false " \
  "); " > /var/www/app/web/config.php

# Launch starter script
sh /tmp/start.sh
