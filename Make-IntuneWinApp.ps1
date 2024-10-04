#This file should be placed in and run from the same directory where the IntuneWinAppUtil.exe is located (c:\Signatures\)
$DateStamp = get-date -uformat "%Y-%m-%d--%H-%M-%S"
$version= "000000"

#Backup the previous created file with a time stamp. 
if (Test-Path "install*.intunewin") 
    {
        $copyfilename = Get-ChildItem -Name "install*.intunewin"
        $name= $copyfilename.Substring(0,7)
        $version= $copyfilename.Substring(7,6)
        $ext = ".intunewin"
        $oldname = $name + $version + $ext
        $copyname = $oldname + $DateStamp
        
        $versionnumber = [int]$version
        $newversionnumber = $versionnumber + 1 
        $newversion = $newversionnumber.tostring("000000")
        $newname = $name + $newversion + $ext 
        write-host "MOVE the old intune file " -nonewline -foregroundcolor green
        write-host "$oldname" -nonewline -foregroundcolor white
        write-host " to: " -nonewline -foregroundcolor green
        write-host "$copyname"

        move-item -path "$oldname" -Destination "$copyname"
    }


#Create a new installxxxxxx.intunewin file
write-host
write-host "Creating the new Intune installation file" -foregroundcolor green
Start-Process -NoNewWindow -FilePath  ".\IntuneWinAppUtil.exe" -ArgumentList "-c C:\Signatures\Set-OutlookSignatures", "-s c:\Signatures\Set-OutlookSignatures\install.cmd", "-o c:\Signatures\" -wait
rename-item -path "install.intunewin" -newname "$newname"

write-host "Intune installation file: " -nonewline -foregroundcolor green
write-host "$newname" -foregroundcolor white

write-host

write-host "IMPORTANT:"                                                    					-nonewline -foregroundColor Red  -BackgroundColor Yellow 
write-host "  The number in the filename: "                                					-nonewline -foregroundcolor green
write-host $newversion                                                     					-nonewline -foregroundcolor white
write-host " should be the same as the version number used in the script and intune!"       -foregroundcolor green

read-host Press ENTER to continue...
