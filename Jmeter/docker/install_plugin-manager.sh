#!/bin/bash

CMD_RUNNER_URL="http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.2.1/cmdrunner-2.2.1.jar"
PLUGIN_MANAGER_URL="https://jmeter-plugins.org/get/"

# DOWNLOAD RUNNER
wget -O "lib/cmdrunner-2.2.1.jar" $CMD_RUNNER_URL

# DOWNLOAD MANAGER
wget -O "lib/ext/jmeter-plugins-manager.jar" $PLUGIN_MANAGER_URL


# GENERATING SCRIPTS
java -cp lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
PluginsManagerCMD.sh install jpgc-webdriver=3.3