GAME_NAME="juicy"
BUILD_DIR="_build"
DISTRO_DIR="distro"
SHARED_DIR="./src/shared"
GAME_DIR="./src/games/$GAME_NAME"

if [ ! -d $GAME_DIR ]
then
	echo "Error: no game directory named ${1}"
	exit
fi

# Clean up directories
mkdir $DISTRO_DIR
rm ./$DISTRO_DIR/$GAME_NAME.love

rm -rf ./$BUILD_DIR
mkdir $BUILD_DIR


# Copy files to build dir
cp -r $SHARED_DIR/* $BUILD_DIR # Shared files
cp -r $GAME_DIR/* $BUILD_DIR # Game-specific

cd $BUILD_DIR

zip -r ../$DISTRO_DIR/$GAME_NAME.love ./*

cd ..

# rm -rf $BUILD_DIR # Disable if we want to inspect output

# Get rid of any running love instances
killall love

sleep 1

open ./$DISTRO_DIR/$GAME_NAME.love
