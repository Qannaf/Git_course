#!/bin/bash
echo "Qannaf AL-SAHMI thank you for your confidence to add these aliases my mail if needed qannafalsahmi@gmail.com"
git config --global alias.logg "log --decorate --graph"
git config --global alias.logc "log --decorate --source --graph --pretty=format:'%C(yellow)%h%Creset -%C(cyan)%d%Creset %s %C(green)(%cr) %C(blue)<%an>%Creset'"
git config --global alias.logp "log --pretty=format:'%Cgreen%ci %Cblue%cn %C(yellow)%cr%Creset %s'"
git config --global alias.logs "log --stat"
git config --global alias.pushh "push origin HEAD:refs/for/master"
git config --global alias.aliases "config --get-regexp '^alias\.'"
git config --global alias.logd "log --diff-filter=D --summary"
git config --global alias.conf "diff --name-only --diff-filter=U"
git config --global alias.dv 'difftool -t vimdiff -y'
git config --global alias.log1 "log --graph --abbrev-commit --decorate --format=format:'%C(bold yellow)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(blue)- %an%C(reset)%C(bold cyan)%d%C(reset)' --all"
git config --global alias.log2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold yellow)%h%C(reset) - %C(dim white)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold cyan)%d%C(reset)%n''          %C(white)%s%C(reset) %C(blue)- %an%C(reset)' --all"
echo "finished thank you"