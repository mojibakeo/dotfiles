function g
  set repo_name (ghq list | fzf-tmux --reverse +m)
  if test -n "$repo_name"
    cd (ghq root)/$repo_name
  end
end

function b
  set branch (git branch --sort=-committerdate | fzf --reverse)
  if test -n "$branch"
    git checkout (echo $branch | sed 's/^[ *]*//')
  end
end
