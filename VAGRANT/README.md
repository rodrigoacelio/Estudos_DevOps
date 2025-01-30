# Módulo Vagrant - Curso DevOps

Este módulo é dedicado ao aprendizado e implementação de **Vagrant** para criação e provisionamento de máquinas virtuais. Inclui desde a configuração inicial até projetos completos utilizando ferramentas como **Ansible** e **Shell Script**.

---

## Estrutura do Módulo

```
VAGRANT/
├── Vagrantfile
├── playbook.yml
├── script.sh
├── site/
│   ├── index.html
│   └── custom/
├── README.md
```

---

## Conteúdo do Módulo

### **1. Vagrantfile**
Arquivo principal para configurar o ambiente Vagrant.
```ruby
Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.name = "primeira_maquina"
  end
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8090
  config.vm.provision "shell", path: "script.sh"
  config.vm.synced_folder "site/", "/var/www/html"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
```

---

### **2. playbook.yml**
Playbook do Ansible para provisionar e configurar serviços na máquina virtual.
```yaml
---
- name: Configuração inicial do servidor
  hosts: all
  become: true

  tasks:
    - name: Atualizar os pacotes do sistema
      apt:
        update_cache: yes

    - name: Instalar pacotes necessários
      apt:
        name:
          - apache2
          - curl
        state: present

    - name: Criar um diretório customizado
      file:
        path: /var/www/html/custom
        state: directory
        mode: '0755'

    - name: Copiar um arquivo HTML de exemplo
      copy:
        content: "<html><body><h1>Site configurado pelo Ansible!</h1></body></html>"
        dest: /var/www/html/index.html
        mode: '0644'
```

---

### **3. script.sh**
Script de provisionamento em Shell Script.
```bash
#!/bin/bash
echo "Provisionando máquina..."
sudo apt-get update
sudo apt-get install -y nginx
```

---

### **4. site/index.html**
Página inicial simples para ser exibida pelo servidor provisionado.
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meu Site</title>
</head>
<body>
    <h1>Bem-vindo ao meu site configurado com Vagrant e Ansible!</h1>
</body>
</html>
```

---

## Como Usar

1. Certifique-se de ter os seguintes pré-requisitos instalados:
   - **Vagrant**
   - **VirtualBox**
   - **Ansible** (caso esteja usando o provisionamento com Ansible).

2. Clone o repositório:
   ```bash
   git clone https://github.com/rodrigoacelio/CursoDevOps.git
   cd VAGRANT
   ```

3. Suba a máquina virtual:
   ```bash
   vagrant up
   ```

4. Acesse o site configurado:
   - No navegador, acesse: `http://localhost:8090`.

---

## Licença

Este projeto está disponível sob a [Licença MIT](LICENSE).

---

Se tiver dúvidas ou sugestões, contribua ou entre em contato! 🚀
