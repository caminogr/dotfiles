alias ds='bundle exec cap staging deploy'
alias rake='bundle exec rake'
alias rdm='bundle exec rake db:migrate'
alias rdc='bundle exec rake db:create'
alias rds='bundle exec rake db:seed'
alias be='bundle exec'
alias os='open -a sublime\ text'
alias ls='ls -G'
alias rs='rails s'
alias rs4='rails s -p 4000'
alias rs5='rails s -p 5000'
alias rc='rails c'
function op() {
    if [ -z "$1" ]; then
        open .
    else
        open "$@"
    fi
}
