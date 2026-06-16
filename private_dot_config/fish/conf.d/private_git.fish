function __fzf_git_checkout
  git branch -a | fzf --reverse | tr -d ' ' | read branch
  if [ $branch ]
      git checkout (echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  end
  commandline -f repaint
end

bind \cb '__fzf_git_checkout'

#function __fzf_git_checkout_commit
#  set commit (git log --oneline --all | fzf --reverse)
#  if test "$commit"
#    set sha (echo $commit | awk '{print $1}')
#    git checkout $sha
#  end
#  commandline -f repaint
#end
#
#bind \cl '__fzf_git_checkout_commit'
