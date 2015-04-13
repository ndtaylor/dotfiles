#! /bin/sh

# This installs gradle.properites into ~/.gradle/
set -e
files=""
if [ -f "$ZSH/gradle/gradle.properties" ]; then
	files="$files $ZSH/gradle/gradle.properties"
fi
if [ -f "$ZSH/gradle/gradle.properties.local" ]; then
	files="$files $ZSH/gradle/gradle.properties.local"
fi

if [ ! -z "$files" ]; then
	if [ ! -e "$HOME/.gradle" ]; then
		echo "Gradle home directory does not exist; creating it..."
		mkdir "$HOME/.gradle"
	fi

	echo "Generating gradle.properties file..."
	`cat $files > $HOME/.gradle/gradle.properties`
else
	echo "No gradle configuration files found."
fi

echo "Done."
