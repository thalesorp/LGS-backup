# LGS backup
# Auto backup Logitech Gaming Software profiles and settings
#
# Version 1.0
# (c) 2021 Thales Pinto <ThalesORP@gmail.com> under the GPL
#          http://www.gnu.org/copyleft/gpl.html
#

# Getting the current date to organize those backups
$CurrentDate = "$(Get-Date -Format yyyy-MM-dd)"

# Creating the name of the backup folder to be created
$BackupFolderName = "$CurrentDate - BACKUP"

# Concatenating the current script folder and the backup folder name
$BackupFolder = ".\$BackupFolderName"

# Create the backup folder. Assigned to null for no output strings
$null = New-Item -ItemType directory -Path $BackupFolder

$LogitechFolder = "C:\Users\$env:UserName\AppData\Local\Logitech\Logitech Gaming Software"

# Copying the "settings.json" file and the "profiles" folder
$settingsFile = "$LogitechFolder\settings.json"
$profilesFolder = "$LogitechFolder\profiles"

# Filter can be added as argument to Copy-Item: "-Filter "*.xml""
Copy-Item -Path $settingsFile -Destination $BackupFolder
Copy-Item -Path $profilesFolder -Recurse -Destination $BackupFolder -Container
