# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# Logging
alias gl='git log --first-parent'
alias glg='git log --graph'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Pushing
alias gp='git push'
function gpsu() { git push --set-upstream origin "$(git_branch)" }

# Pulling
alias gpl='git pull'
alias gsr='git svn rebase'

# Status
alias gd='git diff'
alias gs='git status'

# Committing
alias gc='git commit'
alias gca='git commit -a'
alias gaap='git commit -a --ammend --no-edit'
alias gcam='git commit -am'
alias gcm='git commit -m'
alias ga='git add --all'

# Branching
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'

# Clean up
alias grp='git remote prune origin'
alias gcl='git-cleanup'

function git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

function git-merged() { git branch --merged $@ | sed -e '/^*/d' }

function git-cleanup() { 
	echo "=== Cleaning Remote Branch Caches ==="
	git remote prune origin

	echo "=== Cleaning Local Branches ========="
	except_branches=('"\*"' 'master' 'develop' 'rc')
	command="git branch --merged"
	for branch in $except_branches; do
		command="$command | grep -v $branch"
	done
	command="$command | xargs -n 1 git branch -d"
	eval $command

	echo "=== Remaining Branches =============="
	git branch
}
