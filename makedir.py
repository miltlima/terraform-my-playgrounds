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
        else :
            try:
                os.mkdir(name_dir)
            except FileExistsError:
                print('A pasta já existe')
                continue
        # os.mkdir(name_dir)
        print(f"Pasta criada com sucesso {name_dir}")
        break
    return()


create_dir()
