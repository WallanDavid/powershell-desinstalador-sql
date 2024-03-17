# Verifica se o script está sendo executado como administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Este script precisa ser executado como administrador."
    Exit
}

# Define uma lista de instâncias do SQL Server
$instances = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*SQL Server*" }

if ($instances.Count -eq 0) {
    Write-Output "Nenhuma instância do SQL Server encontrada para desinstalar."
    Exit
}

# Desinstala cada instância encontrada
foreach ($instance in $instances) {
    try {
        Write-Output "Desinstalando $($instance.Name)..."
        $instance.Uninstall()
        Write-Output "Desinstalação de $($instance.Name) concluída."
    } catch {
        Write-Error "Erro ao desinstalar $($instance.Name): $_"
    }
}

# Remove os registros do SQL Server no registro do Windows
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Get-ChildItem $registryPath | Where-Object { $_.GetValue("DisplayName") -like "*SQL Server*" } | ForEach-Object {
    $keyPath = $_.PSPath
    try {
        Write-Output "Removendo registro: $keyPath"
        Remove-Item -Path $keyPath -Recurse -ErrorAction Stop
        Write-Output "Registro removido: $keyPath"
    } catch {
        Write-Error "Erro ao remover registro: $_"
    }
}

# Remove arquivos e diretórios associados ao SQL Server
$commonProgramFiles = [System.Environment]::GetFolderPath('CommonProgramFiles')
$commonProgramFiles += "\Microsoft Shared\"
$commonProgramFiles += (Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft SQL Server Management Studio - 15.0 (64-bit)").InstallLocation

Write-Output "Removendo arquivos e diretórios do SQL Server..."
Remove-Item -Path "$commonProgramFiles\Microsoft SQL Server" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$commonProgramFiles\Microsoft Shared\SqlServr" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:ProgramFiles\Microsoft SQL Server" -Recurse -Force -ErrorAction SilentlyContinue

Write-Output "Desinstalação completa e profunda do SQL Server."
