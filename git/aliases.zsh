# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git log --first-parent'
alias glg='git log --graph'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gaap='git commit -a --ammend --no-edit'
alias gcam='git commit -am'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status' 
alias ga='git add --all'
alias gsr='git svn rebase'
alias grp='git remote prune origin'
alias gcl='git-cleanup'

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
