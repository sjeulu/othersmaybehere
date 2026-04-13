def main [
  sources: string,
  server: string,
  output: string,
] {
  let workdir: string = (mktemp -d)
  print $"initialized tempdir at ($workdir)"
  cd $workdir

  print "copying sources..."
  ls -f $sources | get name | each { cp -r --preserve [] $in . }

  print "patching the instance config..."
  let template = "./instance.template.cfg"
  open $template
    | str replace "@SERVER@" $server
    | save "./instance.cfg"
  rm $template

  print "creating the archive..."
  ^zip $output -r ./*

  print "done"
}
