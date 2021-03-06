SOURCE="https://download-cf.jetbrains.com/cpp/CLion-2020.2.1.tar.gz"
DESTINATION="build.tar.gz"
OUTPUT="CLion.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION)  $(SOURCE)

	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	mv clion-*/* AppDir/opt/application

	chmod +x AppDir/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -rf clion-2019.2.5
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
