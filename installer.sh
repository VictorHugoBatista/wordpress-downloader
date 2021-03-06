#!/bin/bash
bin_path='/usr/bin'
script_name='wp-download'
script_file="$bin_path/$script_name"

RED="\e[91m"
GREEN="\e[92m"
BLUE="\e[94m"
RESET="\e[0m"

if [ -e $script_file ]; then
    echo -e "${GREEN}1 - Atualizar$RESET"
    echo -e "${RED}2 - Remover$RESET"
    echo

    # Pede confirmação sobre a estrutura à ser criada
    opcao=''
    while [ "$opcao" = '' ] || [ "$opcao" != '1' ] && [ "$opcao" != '2' ]; do
        echo 'Entre com uma das opções para prosseguir:'
        read opcao
    done

    if [ "$opcao" = '1' ]; then
        echo -e "O arquivo ${BLUE}${script_name}${RESET} será atualizado no diretório $bin_path"
    else
        echo -e "O arquivo ${BLUE}${script_name}${RESET} será removido do diretório $bin_path"
    fi
else
    echo -e "O arquivo ${BLUE}${script_name}${RESET} será adicionado ao diretório $bin_path"
fi
echo 'Digite "s" para prosseguir ou "n" para cancelar:'

# Pede confirmação sobre a estrutura à ser criada
continue_process=''
while [ "$continue_process" = '' ] || [ "$continue_process" != 's' ] && [ "$continue_process" != 'n' ]; do
    echo -e "Digite ${GREEN}s$RESET para prosseguir ou ${RED}n$RESET para cancelar: \c"
    read continue_process
done
# Para a execução caso a opção selecionada foi 'n'
if [ "$continue_process" = 'n' ]; then
    echo -e "${RED}A operação foi cancelada!${RESET}"
    exit 0
fi

if [ -e $script_file ]; then
    if [ "$opcao" = '1' ]; then
        sudo cp -rf $script_name.sh $script_file
        sudo chmod +x $script_file
        echo -e "Comando ${BLUE}${script_name}${RESET} atualizado com sucesso!"
    else
        sudo rm $script_file
        echo -e "Comando ${BLUE}${script_name}${RESET} desinstalado com sucesso!"
    fi
else
    sudo cp $script_name.sh $script_file
    sudo chmod +x $script_file
    echo -e "Comando ${BLUE}${script_name}${RESET} instalado com sucesso!"
fi

exit 0
