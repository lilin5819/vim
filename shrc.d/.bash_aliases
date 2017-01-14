alias du='du -sh'
alias df='df -h'

alias lsalias='cat ~/.shrc.d/.bash_aliases'
alias vimrclocals='vim -p ~/.vimrc*.local'
alias vilocal='vim ~/.shrc.d/.bash_local'
alias vialias='vim ~/.shrc.d/.bash_aliases'

alias bakit='rename "s/$/.bak/"'

alias rcvenv='[ -d venv ] && source venv/bin/activate '
alias rcsh='source ~/.bashrc'

alias djrs='python manage.py runserver 0.0.0.0'

alias g++='g++ -std=c++11'

alias mkcscopefile='[ -f cscope.files ] || sudo touch cscope.files && sudo chown lilin:lilin cscope.files &&\
    sudo find `pwd` -name "*.[ch]" -o -name "*.cpp" > cscope.files'
alias mkctag='sudo ctags -R'
alias mkcstag='mkcscopefile && sudo cscope -Rbkq -i cscope.files'
#alias mkcstag='sudo cscope -Rbkq -i'
alias mktags='mkctag ; mkcstag'
alias mkycmconf='python ~/.vim/bundle/YCM-Generator/config_gen.py -f --verbose `pwd`'

alias oflash='sudo oflash 0 1 0 0 0'
alias noflash='sudo oflash 0 1 1 0 0'
