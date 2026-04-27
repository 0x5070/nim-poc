import std/[os, strutils, sha1, cpuinfo, math, random, terminal]

when defined(windows):
  type
    POINT = object
      x, y: int32
  proc GetCursorPos(lpPoint: ptr POINT): bool {.importc: "GetCursorPos", stdcall, dynlib: "user32".}

const CompileSeed = staticExec("date +%N")

proc runBenignTask() =
  let x = rand(1.0..100.0)
  let y = rand(1.0..100.0)
  discard pow(x, y)
  sleep(10)

proc checkInteraction(): bool =
  when defined(windows):
    var p1, p2: POINT
    if not GetCursorPos(addr p1): return false
    for i in 1..200:
      runBenignTask()
      if GetCursorPos(addr p2):
        if abs(p1.x - p2.x) > 20 or abs(p1.y - p2.y) > 20: return true
      sleep(100)
    return false
  else:
    sleep(2000)
    return true

proc checkEnv(): bool =
  var score = 0
  try:
    if fileExists("/proc/meminfo"):
      let meminfo = readFile("/proc/meminfo")
      for line in meminfo.splitLines():
        if line.startsWith("MemTotal:"):
          let kb = line.splitWhitespace()[1].parseInt()
          if kb < 4000000: score.inc
          break
  except: discard

  if countProcessors() < 2: score.inc
  
  let artifacts = [
    "/usr/bin/vbox-control", "/usr/sbin/VBoxService", 
    "C:\\Windows\\System32\\drivers\\VBoxMouse.sys",
    "C:\\Windows\\System32\\drivers\\vmtray.sys"
  ]
  for item in artifacts:
    if fileExists(item):
      score.inc
      break
  return score >= 2

proc getBinaryHash(): string =
  try:
    return $secureHash(readFile(getAppFilename()))
  except:
    return "none"

proc playSnake() =
  randomize()
  echo "[*] Initializing alpha component..."
  echo "Juega un poco mientras se cargan los recursos..."
  var points = 0
  while points < 10:
    stdout.write(".")
    stdout.flushFile()
    sleep(100)
    points.inc

if isMainModule:
  playSnake()
  
  if checkInteraction():
    let isIsolated = checkEnv()
    echo "\n--- POC ANALYSIS ---"
    echo "[*] Seed: ", CompileSeed
    echo "[*] Hash: ", getBinaryHash()
    
    if isIsolated:
      echo "[!] Analysis environment detected."
    else:
      echo "[+] Validated execution."
  else:
    echo "[*] Timeout: No interaction."
