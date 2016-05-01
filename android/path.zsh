# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.

sdk_path_file=$ZSH/android/android.local
if [[ -a $sdk_path_file ]]
then
  source $sdk_path_file
fi

if [[ -n "$ANDROID_SDK" ]]
then
  if [ "$(ls -A /usr/local/Cellar/android-sdk)" ]
  then
	echo "Android sdk installed from Homebrew; not adding to path."
  else
	echo "Android sdk was not installed from Homebrew; adding sdk to path..."
  	export PATH="$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$PATH"
  fi
  export ANDROID_HOME=$ANDROID_SDK
fi

