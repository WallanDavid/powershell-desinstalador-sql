Desinstalador Profundo do SQL Server
Este script PowerShell foi desenvolvido para realizar uma desinstalação completa e profunda do SQL Server, removendo todos os seus componentes do sistema, incluindo arquivos e diretórios associados.

Pré-requisitos
PowerShell (versão 5.1 ou superior)
Privilégios de administrador para execução do script
Como Usar
Baixe o arquivo Uninstall-SQLServer.ps1 para o seu computador.
Abra o PowerShell como administrador.
Navegue até o diretório onde o script foi baixado.
Execute o script com o comando .\Uninstall-SQLServer.ps1.
Funcionamento do Script
Verifica se o script está sendo executado como administrador.
Verifica se há instâncias do SQL Server instaladas no sistema.
Desinstala cada instância encontrada do SQL Server.
Remove os registros do SQL Server no registro do Windows.
Remove arquivos e diretórios associados ao SQL Server.
Avisos
Certifique-se de revisar cuidadosamente os resultados antes de executar o script, pois ele realizará alterações no sistema.
É altamente recomendado fazer um backup dos dados importantes antes de executar este script.
Este script foi projetado para desinstalar o SQL Server de forma completa e profunda. Use com cautela.
