# Fake Access Point

## Setting up a Wi-Fi adapter

Check if the system sees the adapter:
```
lsusb
```

Check if the wireless interface (wlan) is up:
```
ifconfig
```

Check if the adapter is working:
```
sudo wifite --kill
```

* If multiple `wlan` are detected, you will be prompted to choose.
* Success is the continuous operation of the `wifite` utility with target detection

## Setting up a Fake Access Point

To launch a fake access point, run the command:
```
nohup sudo berate_ap -n wlan1 FREE_WI-FI > result.txt 2>&1 &
```

The result will be the MAC-address of the wireless interface connecting to the fake access point.

Since it was not possible to configure `pipe` inside the `nohup`, the entire output of the `berate_ap` tool is stored in the `result.txt` file. Next, it will be possible to obtain the MAC-addresses of those connected in this way:
```
cat result.txt | grep AP-STA-CONNECTED | cut -d" " -f3 | uniq
```

To map the MAC address to the hostname you need to use your enterprise solutions, for example FleetDM/Osquery or ARP tables.