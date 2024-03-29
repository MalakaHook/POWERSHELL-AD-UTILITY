﻿Write-Host "Bienvenue dans l'utilitaire de création d'utilisateur AD créer par Francois-Xavier Bérard" -ForegroundColor Green


$name= Read-Host -Prompt "Entrez votre nom de compte (Nom qui s'affichera dans votre liste d'utilisateur AD)"
$GivenName= Read-Host -Prompt "Entrez votre prenom"
$Surname= Read-Host -Prompt "Entrez votre nom de famille"
$SAM= Read-Host -Prompt "Entrez SamAccountName (Non utilisé pour la connection)"
$Principal = Read-Host -Prompt "Entrez votre UserPrincipalName avec @nomdedomaine a la fin. Exemple (berard@annexe.lan)"
$Description = Read-Host -Prompt "Entrez une description ou laissez vide"
$Path= Read-Host -Prompt "Entrez le nom du script de connection. Sinon, laisser vide"
$ADGroup = Read-Host -Prompt "Ajoutez l'utilisateur dans un groupe ? Si oui,entrez le nom du groupe désiré sinon laisser vide"
New-ADUser `
    -Name "$name" `
    -GivenName "$GivenName"`
    -Surname "$Surname"`
	-SamAccountName "$SAM"`
    -UserPrincipalName "$Principal"`
	-Description "$Description"`
    -AccountPassword (Read-Host -AsSecureString "Entrez votre mdp") `
    -scriptPath "$Path"`
	-PasswordNeverExpires:$true `
    -PassThru | Enable-ADAccount
	
Add-ADGroupMember "$ADGroup" "$SAM"  
