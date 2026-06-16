abbr --add vim 'nvim'
abbr --add vi 'nvim'
abbr --add sudo 'sudo -H'
abbr --add cr 'git ci "resolve conflicts"'
abbr --add dcu 'docker compose up -d'
abbr --add dce 'docker compose exec'
abbr --add dcd 'docker compose down'
abbr --add dps 'docker ps'
abbr --add dlogs 'docker compose logs -f'
abbr --add dr 'docker compose restart'
abbr --add drun 'docker compose run -it'
abbr --add dexec 'docker compose exec -it'
# eza がインストールされていれば eza を使用、なければ標準の ls
if type -q eza; or test -x /opt/homebrew/bin/eza
    set -x EZA_COLORS "reset:di=34:ex=31:fi=37:ic=37"
    abbr --add ls 'eza --icons=always'
    abbr --add l 'eza --icons=always --long --git'
    abbr --add la 'eza --icons=always --long --all --git'
    abbr --add ll 'eza --icons=always --long'
else
    abbr --add ls 'ls -G'
    abbr --add l 'ls -lg'
    abbr --add la 'ls -Al'
    abbr --add ll 'ls -l'
end
abbr --add amend 'git commit --amend'
