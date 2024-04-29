# Fonction pour afficher le menu et demander les informations du groupe
function Get-GroupInfo {
    Write-Host "Créer un nouveau groupe dans Active Directory"
    Write-Host ""
    $groupName = Read-Host "Nom du groupe"
    $groupDescription = Read-Host "Description du groupe"
    $groupScope = Read-Host "Portée du groupe (Universal, Global, Domain Local)"
    $groupType = Read-Host "Type de groupe (Security, Distribution)"
    $groupOU = Read-Host "Unité d'organisation (OU) du groupe"
    $groupManager = Read-Host "Nom du responsable du groupe"
    $groupMembers = Read-Host "Membres du groupe (séparés par des virgules)"
    $groupEmail = Read-Host "Adresse e-mail du groupe"
    return @{
        Name = $groupName
        Description = $groupDescription
        Scope = $groupScope
        Type = $groupType
        OU = $groupOU
        Manager = $groupManager
        Members = $groupMembers
        Email = $groupEmail
    }
}

# Obtenir les informations du groupe à partir du menu
$groupInfo = Get-GroupInfo

# Créer le groupe dans Active Directory avec les informations spécifiées
New-ADGroup -Name $groupInfo.Name `
    -Description $groupInfo.Description `
    -GroupScope $groupInfo.Scope `
    -GroupCategory $groupInfo.Type `
    -Path $groupInfo.OU `
    -Manager $groupInfo.Manager `
    -Members $groupInfo.Members `
    -EmailAddress $groupInfo.Email