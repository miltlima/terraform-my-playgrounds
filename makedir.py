# coding: future_fstrings
import os

path = os.getcwd()
print(f'Voce esta no diretorio {path}')


def create_dir():
    while True:
        name_dir = str(input("Informe o nome do projeto que deseja criar: "))
        if name_dir == '':
            continue
        else:
            os.mkdir(name_dir)
            print(f"Pasta criada com sucesso {name_dir}")
        return()


create_dir()
