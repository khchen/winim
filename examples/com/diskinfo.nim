#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2021 Ward
#
#====================================================================

import winim/com
import strformat except `&`

var wmi = GetObject("winmgmts:{impersonationLevel=impersonate}!//.")
for drive in wmi.ExecQuery("SELECT * FROM Win32_DiskDrive"):
  echo fmt"Drive: {drive.caption} [{drive.serialnumber}] ({drive.deviceid})"

  for partition in wmi.ExecQuery(fmt"""
      ASSOCIATORS OF {{Win32_DiskDrive.DeviceID='{drive.deviceid}'}}
      WHERE AssocClass = Win32_DiskDriveToDiskPartition"""):

    var msg = "  " & $partition.DeviceID

    for disk in wmi.ExecQuery(fmt"""
        ASSOCIATORS OF {{Win32_DiskPartition.DeviceID='{partition.deviceid}'}}
        WHERE AssocClass = Win32_LogicalDiskToPartition"""):
        msg.add fmt" is {disk.deviceid} [{disk.volumeserialnumber}]"

    echo msg
