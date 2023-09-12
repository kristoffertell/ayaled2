tmp_file=PKGBUILD_LOCAL
cp PKGBUILD $tmp_file

# Comment out lines to prevent fetching from GitHub and overriding srcdir and targetdir
sed -i 's/source=/#source=/' $tmp_file
sed -i 's/sha256sums=/#sha256sums=/' $tmp_file
sed -i 's/cd /#cd /' $tmp_file
sed -i 's/srcdir=/#srcdir=/' $tmp_file
sed -i 's/target_parent_dir=/#target_parent_dir=/' $tmp_file

makepkg -f -p $tmp_file
rm $tmp_file

# Update SRCINFO in case this build should be pushed to AUR
makepkg --printsrcinfo > .SRCINFO
