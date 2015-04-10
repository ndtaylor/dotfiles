# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.

sdk_path_file=$ZSH/android/path.local
if [[ -a $sdk_path_file ]]
then
  source $sdk_path_file
fi

if [[ -n "$ANDROID_SDK" ]]
then 
  export PATH="$ANDROID_SDK/platform-tools:$PATH"
fi

