#!/bin/bash
vagrant_version=2.2.9
vagrant_file=vagrant_${vagrant_version}_x86_64.msi
vagrant_url=https://releases.hashicorp.com/vagrant/${vagrant_version}/${vagrant_file}
atom_version=v1.48.0
atom_file=AtomSetup-x64.exe
atom_url=https://atom-installer.github.com/${atom_version}/${atom_file}
for url in $vagrant_url $atom_url;do
  [[ ! -f $(basename $url) ]] \
    && curl -k $url -o $(basename $url) \
    && msiexec.exe //passive //qn //i $(basename $url)
done
