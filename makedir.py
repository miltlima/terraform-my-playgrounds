# Name : Project Make dir
# Author Milton Lima
# Release:
# Version: 0.0.1

import os
import sys

path = os.getcwd()
print(f'Voce está no diretório {path}')


def create_dir():
    while True:
        name_dir = str(input("Informe o nome do projeto que deseja criar: "))
        if name_dir == '':
            continue
        else:
            try:
                os.mkdir(name_dir)
            except FileExistsError:
                print('A pasta do projeto já existe')
                continue
        print(f"Pasta do projeto criada com sucesso {name_dir}")
        response = str(input("Deseja criar outro ? S/N ou qualquer tecla para sair: "))
        if response == "S" or response == "s":
            create_dir()
        elif response == "N" or response == "n":
            break
        else:
            break
        return()

def create_files():
    dir_list = os.listdir('.')
    print(dir_list)
    path = str(input("Informe qual Projeto você deseja criar esses arquivos: "))
    if path in dir_list:
        os.chdir(path)
        print(os.listdir('.'))
    elif path not in dir_list:
        response = str(input("O Projeto não existe, deseja criar-lo S/N"))
        if response == "S" or response == "s":
            create_dir()
        else:
            
    else:
      default_files = str(input("Deseja criar os arquivos default Terraform para AWS ? "))
    return()

create_dir()
create_files()