#___________________________________________________________________________________________________
#
# Welcome to Splice Sample Helper!
#
# This script creates hard links to the samples in your Splice folder, in a folder that you specify.
# The hardlink files behave like a copy of the file for all intents and purposes; 
# but are more storage-efficient, as the file is actually only stored once on the disk.
#
# You can then browse the hardlinked files in your DAW, reorganize them in subfolders,
# rename files, delete files, etc., without causing any issues for the Splice desktop app.
#
# At the script entry point in the code below, update 1) the path of your Splice samples folder,
# and 2) the path to the folder where you want to put the hardlinks.
#
# When you download new samples from Splice, simply run the script again to create hardlinks for the
# new samples. You'll see the new samples show up in the root directory of the folder containing
# your hardlinks.
#___________________________________________________________________________________________________

function CreateSampleHardlinks {
    param ($spliceSamplesFolder, $linkedSamplesFolder)

    $spliceSamples = Get-ChildItem -Path $spliceSamplesFolder -Recurse -Include *.wav,*mp3
    $linkedSamples = Get-ChildItem -Path $linkedSamplesFolder -Recurse -Include *.wav,*mp3

    $linkedSamplesDict = @{}
    foreach ($filePath in $linkedSamples)
    {
        $linkedSamplesDict.Add((Get-FileHash -Path $filePath).Hash, $filePath)
    }

    $countCreated = 0
    foreach ($filePath in $spliceSamples)
    {
        if (!$linkedSamplesDict.Contains((Get-FileHash -Path $filePath).Hash))
        {
            $fileName = [System.IO.Path]::GetFileName($filePath)
            Write-Host (cmd /c mklink /H ($linkedSamplesFolder + "\" + $fileName) $filePath)
            $countCreated++
        }
    }
    Write-Host "`n$countCreated hardlink(s) created.`n"
}

#=====================================
# Script entry point
#=====================================

# Update file paths here
$spliceSamplesFolder = "C:\Music\Splice\Samples"
$linkedSamplesFolder = "C:\Music\SpliceHardlinks"

Write-Host `n
Write-Host "#############################################"
Write-Host "#                                           #"
Write-Host "#     Welcome to Splice Sample Helper!      #"
Write-Host "#                                           #"
Write-Host "#############################################"
Write-Host `n

Write-Host "Splice samples folder:`n$spliceSamplesFolder`n"
Write-Host "Linked samples folder:`n$linkedSamplesFolder`n"

Write-Host "If folder paths are correct, enter 'Y' to continue."
Write-Host "Otherwise please exit and update the folder paths in the script.`n"

Write-Host -NoNewLine "Continue? (Y/N) "
$response = Read-Host
Write-Host "`n"

if ( !($response -eq "Y" -or $response -eq "y" )) { Exit }

if (!(Test-Path -Path $spliceSamplesFolder) -or !(Test-Path -Path $linkedSamplesFolder) `
        -or $spliceSamplesFolder -eq $linkedSamplesFolder)
{
    Write-Host "Invalid folder path(s); please verify the paths and try again."
}
else
{
    CreateSampleHardlinks -spliceSamplesFolder $spliceSamplesFolder `
            -linkedSamplesFolder $linkedSamplesFolder
}

pause