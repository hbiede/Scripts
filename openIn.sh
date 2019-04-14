#!/bin/sh
brew install duti
duti -s com.apple.Finder ftp
echo "Setting sh, plist, m, h, cpp, c, java, php, swift, html, htm, css, js, wkt, csv, dat, xml, json, py, lua, vhdl, yaml, md, mf, txt, and tex to open in BBEdit"
echo "Setting mp4, mp3, m4a, and avi to open in VLC"

duti -s com.barebones.bbedit .sh all
duti -s com.barebones.bbedit .plist all
duti -s com.barebones.bbedit .m all
duti -s com.barebones.bbedit .h all
duti -s com.barebones.bbedit .cpp all
duti -s com.barebones.bbedit .c all
duti -s com.barebones.bbedit .java all
duti -s com.barebones.bbedit .php all
duti -s com.barebones.bbedit .swift all
duti -s com.barebones.bbedit .html all
duti -s com.barebones.bbedit .htm all
duti -s com.barebones.bbedit .css all
duti -s com.barebones.bbedit .js all
duti -s com.barebones.bbedit .wkt all
duti -s com.barebones.bbedit .csv all
duti -s com.barebones.bbedit .dat all
duti -s com.barebones.bbedit .xml all
duti -s com.barebones.bbedit .json all
duti -s com.barebones.bbedit .py all
duti -s com.barebones.bbedit .tex all
duti -s com.barebones.bbedit .lua all
duti -s com.barebones.bbedit .vhdl all
duti -s com.barebones.bbedit .yaml all
duti -s com.barebones.bbedit .json all
duti -s com.barebones.bbedit .md all
duti -s com.barebones.bbedit .mf all
duti -s com.barebones.bbedit .py all
duti -s com.barebones.bbedit .txt all
duti -s com.barebones.bbedit .tex all
duti -s com.apple.Preview .cr2 all
duti -s org.videolan.vlc .mp4 all
duti -s org.videolan.vlc .mp3 all
duti -s org.videolan.vlc .m4a all
duti -s org.videolan.vlc .avi all

brew uninstall duti
brew cleanup