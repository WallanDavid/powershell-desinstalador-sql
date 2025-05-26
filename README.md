# 🧹 PowerShell – Desinstalador Profundo do SQL Server

Este script PowerShell foi desenvolvido para realizar uma **desinstalação completa do SQL Server**, eliminando todas as instâncias e componentes relacionados, incluindo arquivos residuais, diretórios e entradas no registro do Windows.

---

## ⚠️ Aviso Importante

🚨 Este script **realiza alterações críticas no sistema operacional**.  
Recomenda-se:

- Fazer backup dos dados importantes
- Verificar se não há outras aplicações dependentes do SQL Server
- Executar apenas se o objetivo for remover completamente o SQL Server da máquina

---

## ✅ Pré-requisitos

- Windows com **PowerShell 5.1 ou superior**
- Executar o PowerShell como **Administrador**
- Permissão para realizar alterações no sistema

---

## ▶️ Como Usar

1. **Baixe o script:**  
   `desinstaldorsql.ps1`

2. **Abra o PowerShell como Administrador**

3. **Navegue até o diretório onde o script foi salvo:**  
   `cd "Caminho\do\arquivo"`

4. **Execute o script:**  
   `.\desinstaldorsql.ps1`

---

## ⚙️ O Que o Script Faz?

- Verifica se está sendo executado com privilégios de administrador  
- Detecta instâncias instaladas do SQL Server  
- Desinstala todas as instâncias encontradas  
- Remove entradas do SQL Server do **registro do Windows**  
- Apaga **pastas e arquivos** associados ao SQL Server no sistema

---

## 📜 Licença

Este projeto está licenciado sob os termos da [MIT License](LICENSE).

---

## 📫 Contato

**Desenvolvedor:** Wallan David Peixoto  
**Email:** bobwallan2@gmail.com  
**LinkedIn:** https://www.linkedin.com/in/wallanpeixoto
