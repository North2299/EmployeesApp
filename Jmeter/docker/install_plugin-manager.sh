#!/bin/bash

CMD_RUNNER_URL="http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar"
PLUGIN_MANAGER_URL="http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/1.7/jmeter-plugins-manager-1.7.jar"

# DOWNLOAD RUNNER
wget -O " /jmeter/apache-jmeter-5.4.3/lib/cmdrunner-2.2.1.jar" $CMD_RUNNER_URL

# DOWNLOAD MANAGER
wget -O " /jmeter/apache-jmeter-5.4.3/lib/ext/jmeter-plugins-manager.jar" $PLUGIN_MANAGER_URL


# GENERATING SCRIPTS
java -cp  /jmeter/apache-jmeter-5.4.3/lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
PluginsManagerCMD.sh install jpgc-webdriver=3.3

