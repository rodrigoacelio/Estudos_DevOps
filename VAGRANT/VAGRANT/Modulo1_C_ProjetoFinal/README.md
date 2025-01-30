# Modulo1_C_ProjetoFinal

Este projeto final consolida os aprendizados do curso, incluindo a configuração de um ambiente virtualizado utilizando **Vagrant**, **VirtualBox**, e **Ansible**.

## Estrutura do Projeto

- `Vagrantfile`: Arquivo de configuração do Vagrant para provisionar as máquinas virtuais.
- `playbook.yml`: Playbook do Ansible para provisionar serviços na VM.
- `script.sh`: Script de shell para tarefas de provisionamento inicial.
- `site/`: Diretório contendo arquivos do site para deploy.

## Pré-requisitos

- **Vagrant**
- **VirtualBox**
- **Ansible**

## Como usar

1. Clone este repositório:
   ```bash
   git clone https://github.com/rodrigoacelio/CursoDevOps.git
   cd CursoDevOps/Modulo1_C_ProjetoFinal
   ```

2. Suba a máquina virtual:
   ```bash
   vagrant up
   ```

3. Acesse o ambiente em `http://localhost:8090`.

## Licença

Este projeto é open-source e está disponível sob a MIT License.
