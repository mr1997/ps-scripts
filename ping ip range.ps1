# Define the range of IP addresses
$startIp = "192.168.1.1"
$endIp = "192.168.1.20"  # Adjust this to the ending IP address you want

# Loop through the IP range and ping each address
for ($i=1; $i -le 255; $i++) {    #i=last octet of start IP
    # Calculate the current IP address
    $currentIp = "$startIp"
    $currentIpArray = $currentIp.Split('.')
    $currentIpArray[3] = $i.ToString()
    $currentIp = $currentIpArray -join '.'

    # Ping the current IP address
    $pingResult = Test-Connection -ComputerName $currentIp -Count 1 -ErrorAction SilentlyContinue

    # Check the result of the ping
    if ($pingResult -ne $null) {
        Write-Host "Ping successful: $currentIp"
    } else {
        Write-Host "Ping failed: $currentIp"
    }
}
