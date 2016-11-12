set configFile ~/.config/fish/config.fish
alias newfish="vim $configFile"
alias g++='g++-6'
alias l="ls"
function new --description 'new <func> <command>  add new alias to fish shell'
    switch (count $argv)
        case 2
            set ARG1  $argv[1]
            set ARG2  $argv[2]
            #echo "alias $ARG1  $ARG2" >> $configFile
            alias $ARG1=$ARG2
            funcsave $ARG1
            echo "New command entered successfully: "
            echo "$ARG1 => $ARG2"
        case '*'
            echo Two args are requeired.
            echo count $argv
            # eccho $argv
    end
end

function del --description 'del <func name>  delete added alias or function'
    switch (count $argv)
        case 1
            cat ~/.config/fish/functions/$argv.fish
            echo 'Delete above command? y/Y'
            read -l confirm
            switch $confirm
                case Y y
                    #sed -i '' -e '$ d'  ~/.config/fish/config.fish
                    rm -rf ~/.config/fish/functions/$argv.fish
                    echo 'Successful deleted.'
                case '*'
                    echo 'Action canceled.'
            end
        case '*'
            echo 'Only one arguments are allowed.'
    end

end