# wordpress-docker-generator
Baixa a estrutura de arquivos daa última versão do wordpress automaticamente no diretório atual.

## Requisitos
 * Sistema que permita a execução de [shell scripts](https://pt.wikipedia.org/wiki/Shell_script)

## Instalação
 * Dê permissão de execução ao arquivo installer.sh;
 ```
 chmod +x installer.sh
 ```
 * Execute o arquivo por meio do comando **./installer.sh**;
 * O script irá instalar o comando gerador de ambientes após uma mensagem de confirmação;
 * Após isso o comando **wp-download** estará disponível. O comando pode ser executado sem parãmetros para a exibição da ajuda.
 
## Atualização / desinstalação
* Com o comando já disponível no sistema, execute o arquivo installer.sh por meio de **./installer.sh**;
* Selecione a opção **1** para atualizar o script com a versão no diretório atual ou a opção **2** para remover o script do sistema.

## Documentação
 * Parâmetros obrigatórios:
    * Título do projeto, define o título do diretório raíz;
 * Exemplo:
    * **wp-download projeto-teste**
 * Ao executar o comando exbido acima, a seguinte estrutura será criada à partir do seu diretório atual (**você ainda pode prosseguir ou cancelar antes que a estrutura seja gerada**):
  ```
  - projeto-teste
  | - diretórios e arquivos da instalação da última versão wordpress
  ```
