$path = "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard"
$name = "InitialKeyboardIndicators"
$value = "2"

# Create path if it doesn't exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set the value
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType String -Force | Out-Null