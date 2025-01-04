import tables, strutils, os

# proc getNamedArg(name: string, defaultValue: string = ""): string =
#   for i in 1..paramCount():
#     if paramStr(i) == name and i < paramCount():
#       return paramStr(i + 1)
#   return defaultValue

# let binary_path = getNamedArg("--name", "")

# Function to read key-value pairs from a file
proc readKeyValuePairs(filename: string): Table[string, string] =
  var res = initTable[string, string]()
  
  if fileExists(filename):
    for line in lines(filename):
      let trimmedLine = line.strip()

      if trimmedLine != "" and '=' in trimmedLine:
        let parts = trimmedLine.split('=')
        if parts.len == 2:
          res[parts[0].strip()] = parts[1].strip()
        else:
          echo "Invalid line format: ", line
  else:
    echo "File not found: ", filename

  return res

# Main program
let filename = ".env"
let keyValues = readKeyValuePairs(filename)

# set env vars
for key, value in keyValues.pairs: 
  let envVarName = key.toUpperAscii();
  putEnv(envVarName, value)