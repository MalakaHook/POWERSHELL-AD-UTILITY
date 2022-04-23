Write-Host "Bienvenue dans l'utilitaire de suppression d'utilisateur AD créer par Francois-Xavier Bérard" -ForegroundColor Red
$SAM= Read-Host -Prompt "Entrez SamAccountName (Non utilisé pour la connection) que vous désirez supprimer"
Remove-ADUser -Identity "$SAM"