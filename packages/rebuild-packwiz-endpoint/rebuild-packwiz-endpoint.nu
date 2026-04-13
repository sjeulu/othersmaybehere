def main [
  packwiz_metadata: string,
  # Path to the packwiz metadata directory, where pack.toml can be found

  endpoint: string,
  # Path to the packwiz endpoint directory, from which the files will be served
] {
  print "cleaning the endpoint..."
  ls -f $endpoint | get name | each { rm -r $in }
  print "repopulating it with new files..."
  ls -f $packwiz_metadata
    | get name
    | each {
      cp --preserve [] -r $in $endpoint
    }
  print "done"
}
