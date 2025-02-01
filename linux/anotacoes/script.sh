#!/bin/bash

echo "Criando diretórios..."

mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários do setor Administrativo..."

useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM carlos
useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM maria
useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM joao

echo "Criando usuários do setor Vendas..."

useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN debora
useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN roberto
useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN vanessa

echo "Criando usuários do setor Secretariado..."

useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC jose
useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC camila
useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC patricia

echo "Especificando permissões aos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim do script."
