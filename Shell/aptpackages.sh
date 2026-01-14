for pkg in $(dpkg --get-selections | grep -v deinstall | cut -f1); do
    echo "Package: $pkg" >> installed_packages_locations.txt
    dpkg-query -L $pkg >> installed_packages_locations.txt
    echo "-----------------------------" >> installed_packages_locations.txt
done
