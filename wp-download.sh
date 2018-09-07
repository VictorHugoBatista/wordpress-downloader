if [ $# -lt 1 ]; then
	echo '                                      d8b'
	echo '                                      88P'
	echo '                                     d88'
	echo ' ?88   d8P  d8P d8888b   88bd88b d888888  ?88,.d88b,  88bd88b d8888b .d888b, .d888b,'
	echo ' d88  d8P| d8P|d8P| ?88  88P|  `d8P| ?88  `?88|  ?88  88P|  `d8b_,dP ?8b,    ?8b,'
	echo ' ?8b ,88b ,88| 88b  d88 d88     88b  ,88b   88b  d8P d88     88b       `?8b    `?8b'
	echo ' `?888P|888P|  `?8888P|d88|     `?88P|`88b  888888P|d88|     `?888P|`?888P| `?888P|'
	echo '                                            88P|'
	echo '                                           d88'
	echo '                                           ?8P'
	echo '      _                     _                 _'
	echo '   __| | _____      ___ __ | | ___   __ _  __| | ___ _ __'
	echo '  / _` |/ _ \ \ /\ / / ._ \| |/ _ \ / _` |/ _` |/ _ \ .__|'
	echo ' | (_| | (_) \ V  V /| | | | | (_) | (_| | (_| |  __/ |'
	echo '  \__,_|\___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|\___|_|'
	echo ''                                           
	echo 'Parâmetros esperados:'
	echo ' - título do projeto'
	exit 0
fi

project_title=$1
echo "O wordpress será baixado no diretório \"$project_title\""
echo ''

# Pede confirmação sobre a estrutura à ser criada
continue_process=''
while [ "$continue_process" = '' ] || [ "$continue_process" != 's' ] && [ "$continue_process" != 'n' ]; do
	echo 'Pressione "s" ou "n" para prosseguir:'
	read continue_process
done

# Para a execução caso a opção selecionada foi 'n'
if [ "$continue_process" = 'n' ]; then
	echo 'A operação foi cancelada!'
	exit 0
fi

# Verifica a existência de um arquivo com o nome
# sugerido para ser o diretório raíz do site. Se
# sim, para o programa com status 1.
if [ -e $project_title ]; then
	echo "Um arquivo/diretório de nome $project_title já existe!"
	exit 1
fi

# Gera a estrutura de arquivos
mkdir $project_title
cd $project_title

# Baixa a instalação vazia do wordpress automaticamente
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .
rm -r wordpress
rm latest.tar.gz

chmod -R 755

# Exibe estrutura de arquivos
echo 'Estrutura criada com sucesso:'
ls -la

cd -

exit 0
