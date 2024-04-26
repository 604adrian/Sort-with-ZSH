#!/bin/zsh

if command -v convert >/dev/null 2>&1; then
  yellow=$(tput bold setaf 3)
  normal=$(tput sgr0)
  bold=$(tput bold)

  echo "✅ $bold ImageMagik is installed"

  vared -p "Enter extension type of input files (eg png, svg, jpg, etc): " -c inputType
  echo "   ${yellow}Input type set to $inputType ${normal}"

  vared -p "Enter extension type of output files: " -c outputType
  echo "   $yellow Output type set to $outputType $normal"

  echo ''

  dirs=()

  for dir in */; do
    cd $dir;
    echo "$yellow Entering $dir... $normal"

    images=(./*${inputType})
    images=(${(o)images})

    if [[ ${#images[@]} -gt 0 ]]; then 

      # Convert to PDF
      random_prefix=$(openssl rand -hex 6)
      touch "all_photos-$random_prefix.pdf"
      outputFile="./all_photos-$random_prefix.pdf"
      convert ${images[@]} ${outputFile} 
      echo "   🚀 $bold Images in $dir converted to PDF $normal"
      
      # Convert image filetypes
      for image in $images; do
        filename=${image:t}
        ext=${filename:r}
        convert "$filename" "${filename:r}.${outputType}"
        rm $filename
        echo "   ✅ $ext $bold converted from $inputType to $outputType $normal"
      done
    else
      echo "$bold No file with $inputType found."
      continue
    fi
    ls -l .
    echo ''
    cd ..
  done
else
  echo '   ❌ ImageMagik is not installed. Please install ImageMagik before proceeding'
fi
