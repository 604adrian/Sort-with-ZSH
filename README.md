# A simple ZSH script for archival researchers
This is a ZSH script written for the fairly niche purpose: sorting through large quantities of photos taken in the process of archival research. I wrote it for a researcher I know who was faced with the daunting task of sorting through and organizing roughly 12,000 photos of old historical documents. This script automated that process.

## How it works
The script works like this. First it goes through each directory within the directory it is called upon and assembles every photo in that directory into a single PDF file. This is useful for reassembling historical documents that have been disassembled into a bundle of discrete photos, but it does require that the researcher is organized, limiting themselves to one document per directory. Then it converts each photo from its particular format to some other format of your choosing. This is meant to make sharing photos easier -- it can convert images out of e.g. HEIF (common on Apple devices) to PNG (common on all devices), ensuring that the recipient will be able to open the photos regardless of their computer's setup.

## How to use it
The script works like this.
* The main script can be found in [convert.zsh](./convert.zsh).
* There is also the [cleanup.zsh](./cleanup.zsh) script which I used to clean up excess PDFs when I was testing the script -- might come in handy.
* This script has two dependencies: [ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH), and [ImageMagick](https://imagemagick.org/) -- both must be installed on your computer for the script to work.

DISCLAIMERS
===========  
⚠️  **Make sure that you've backed up all your files before running this script**, just in case (it would suck to have hundreds of hours of archival research wiped out due to a silly computer error).

⚠️  **Do not run this script in a directory that contains files unrelated to your research**. This script may enter and edit *any* file within a directory contained within the directory it is currently running in. Make sure that you are not storing anything in the current directory that you do not want to the script to interact with.
