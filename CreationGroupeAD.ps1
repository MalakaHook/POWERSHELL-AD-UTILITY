 Write-Host "Bienvenue dans l'utilitaire de création de groupe du domaine" -ForegroundColor Green
$name= Read-Host -Prompt "Entrez le nom du groupe"
$gpcat= Read-Host -Prompt "Entrez la catégorie (Security/Distribution)"
$gpscope= Read-Host -Prompt "Entrez le type de groupe (Global/DomainLocal)"
$description= Read-Host -Prompt "Entrez une description du groupe ou laissez vide"
New-ADGroup `
-Name "$name"`
-GroupCategory "$gpcat"`
-GroupScope "$gpscope"`
-Description "$description"