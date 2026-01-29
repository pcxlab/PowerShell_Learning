#=============================================================
# 1. Basics: Variables & Output
#=============================================================

# Variables
$name = "John"
$age = 25

# Output
Write-Host $name
Write-Output "Age is $age"

# Notes
# $ is mandatory for variables
# Write-Host → display only
# Write-Output → sends data to pipeline


#=============================================================
# 2. Data Types
#=============================================================

[int]$number = 10
[string]$text = "Hello"
[bool]$isAdmin = $true

# Check type
$number.GetType()


#=============================================================
# 3. Arrays
#=============================================================

$friends = "Raju", "Dhanu", "Deepu", "Pakku"

# Access elements
$friends[0]

# Loop through array
foreach ($friend in $friends) {
    Write-Host $friend
}


#=============================================================
# 4. HashTables (Key–Value)
#=============================================================

$user = @{
    Name = "Krish"
    Age  = 30
}

# Accessing HashTables
$user.Name
$user["Age"]


#=============================================================
# 5. Conditional Statements (IF / ELSE)
#=============================================================

# Basic IF
$number = 5
if ($number -gt 3) {
    Write-Host "Number is greater than 3"
}

# IF / ELSE
if ($number -eq 10) {
    Write-Host "Number is 10"
}
else {
    Write-Host "Number is not 10"
}

# ELSEIF
if ($number -gt 10) {
    "Greater than 10"
}
elseif ($number -eq 5) {
    "Number is 5"
}
else {
    "Less than 5"
}


#=============================================================
# 6. Comparison Operators
#=============================================================

# | Operator | Meaning          |
# | -eq      | equal            |
# | -ne      | not equal        |
# | -gt      | greater than     |
# | -lt      | less than        |
# | -ge      | greater or equal |
# | -le      | less or equal    |

# Example
5 -gt 3


#=============================================================
# 7. Logical Operators
#=============================================================

if ($age -gt 18 -and $isAdmin) {
    "Access granted"
}

if ($age -lt 18 -or $isAdmin) {
    "Limited access"
}

if (-not $isAdmin) {
    "Not an admin"
}


#=============================================================
# 8. Loops (VERY IMPORTANT)
#=============================================================

# 1. FOR Loop
for ($i = 1; $i -le 5; $i++) {
    Write-Host "Count: $i"
}

# 2. FOREACH Loop (Most Common)
$friends = "Raju", "Dhanu", "Deepu", "Pakku"

foreach ($friend in $friends) {
    Write-Host $name   # Keeping as-is (even though logically it should be $friend)
}

# 3. WHILE Loop
$count = 1
while ($count -le 5) {
    Write-Host $count
    $count++
}

# 4. DO WHILE Loop (Runs at least once)
$count = 1
do {
    Write-Host $count
    $count++
} while ($count -le 5)

# 5. DO UNTIL Loop
$count = 1
do {
    Write-Host $count
    $count++
} until ($count -gt 5)


#=============================================================
# 9. Switch Statement
#=============================================================

$day = "Monday"

switch ($day) {
    "Monday" { "Start of week" }
    "Friday" { "End of week" }
    default  { "Normal day" }
}


#=============================================================
# 10. Functions
#=============================================================

function Say-Hello {
    param ($name)
    Write-Host "Hello $name"
}

# Calling function
Say-Hello -name "Nick"


#=============================================================
# 11. Pipeline (|) – PowerShell SUPERPOWER
#=============================================================

Get-Process | Where-Object { $_.CPU -gt 100 }

# Explanation:
# Get-Process → gets processes
# Where-Object → filters
# $_ → current object


#=============================================================
# 12. Common Cmdlets
#=============================================================

Get-Command
Get-Help Get-Process
Get-Service
# Start-Service
# Stop-Service


#=============================================================
# 13. Working with Files
#=============================================================

# Create file
New-Item -Path "C:\Temp\test.txt" -ItemType File -Force

# Read file
Get-Content "C:\Temp\test.txt"

# Write to file
"Hello World" | Out-File "C:\Temp\test.txt"


#=============================================================
# 14. Try / Catch (Error Handling)
#=============================================================

try {
    Get-Item "C:\NotExist.txt"
}
catch {
    Write-Host "File not found"
}


#=============================================================
# 15. Scripts (.ps1)
#=============================================================

# MyScript.ps1
Write-Host "Hello from script"

# Run:
# .\MyScript.ps1


#=============================================================
# Suggested Practice Order
#=============================================================

# Variables
# IF / ELSE
# Loops
# Arrays & HashTables
# Functions
# Pipeline
# File handling
# Error handling


####################################
# Variables explanation (kept fully as comments)
####################################

# Variables (Variables is like a box which has name for that box and we can put some items
# based on the box type and size)

$name = "John"   # "name" is the box name, "John" is a string
$age = 25        # "age" is the box name, 25 is a number

# Output to Console (Temporary)
Write-Host $name
Write-Output "Age is $age"

# Output to file (Overwrite)
$name | Out-File -FilePath "C:\Logs\info.txt"

# Output to file (Append)
Add-Content -Path "C:\Logs\info.txt" -Value "$name"


#############################
# Simple redirection
#############################

# Overwrite
"$name" > "C:\Logs\info.txt"

# Append
"$age" >> "C:\Logs\info.txt"


##############
# Add timestamp (recommended for real logs)
##############

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content "C:\Logs\age.log" "$timestamp - Age is $name"

# Permanent, reusable logging
Add-Content "C:\Logs\info.txt" "$name"


####################################
# Repeated section preserved exactly
####################################

$name = "John"
$age = 25

Write-Host $name
Write-Output "Age is $age"

$name | Out-File -FilePath "C:\Logs\info.txt"
Add-Content -Path "C:\Logs\info.txt" -Value "$name"

"$name" > "C:\Logs\info.txt"
"$age" >> "C:\Logs\info.txt"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content "C:\Logs\age.log" "$timestamp - Age is $name"

Add-Content "C:\Logs\info.txt" "$name"
