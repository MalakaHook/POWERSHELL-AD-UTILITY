Write-Host "============= Powershell Utility=============="
Write-Host "`t1. 'A' Créer un nouvel utilisateur AD"
Write-Host "`t2. 'B' Supprimer un utilisateur AD"
Write-Host "`t3. 'C Créer un groupe dans le AD"
Write-Host "`t4. 'Q Quitter'"
Write-Host "========================================================"
$choice = Read-Host "`nFaite un choix"
switch ($choice) {
   'A'{
       Write-Host "Bienvenue dans l'utilitaire de création d'utilisateur AD créer par Francois-Xavier Bérard" -ForegroundColor Green


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

   }
   'B'{
      Write-Host "Bienvenue dans l'utilitaire de suppression d'utilisateur AD créer par Francois-Xavier Bérard" -ForegroundColor Red
$SAM= Read-Host -Prompt "Entrez SamAccountName (Non utilisé pour la connection) que vous désirez supprimer"
Remove-ADUser -Identity "$SAM"
   }
   'C'{
       Write-Host "Bienvenue dans l'utilitaire de création de groupe du domaine" -ForegroundColor Green
$name= Read-Host -Prompt "Entrez le nom du groupe"
$gpcat= Read-Host -Prompt "Entrez la catégorie (Security/Distribution)"
$gpscope= Read-Host -Prompt "Entrez le type de groupe (Global/Universal/DomainLocal)"
$description= Read-Host -Prompt "Entrez une description du groupe ou laissez vide"
New-ADGroup `
-Name "$name"`
-GroupCategory "$gpcat"`
-GroupScope "$gpscope"`
-Description "$description"
   }
   'Q'{Return}
}