@echo off
rem This file is used by RES so we have a smooth hidden installation during every login of a user on Citrix.
rem can also be used for local/test installations
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe  -ExecutionPolicy bypass -File .\Set-OutlookSignatures.ps1 -BenefactorCircleId "xxxxxxxxxxxxxxxxxxxxxx" -BenefactorCircleLicenseFile ".\license.dll"  -SignatureCollectionInDrafts $false -GraphOnly $true -add additional parameters here
