FREEPLANE_PATH=$HOME/workspace/opensource/freeplane

if [ -d "$FREEPLANE_PATH" ]; then
    echo "$FREEPLANE_PATH exists."
    read -p "Do you want to remove it and clone it again? (y/N)" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "Removing $FREEPLANE_PATH"
        sudo rm -rf $FREEPLANE_PATH

        echo "Cloning freeplane repository..."
        git clone https://github.com/freeplane/freeplane.git $FREEPLANE_PATH && cd $FREEPLANE_PATH

        echo "Building freeplane..."
        sudo docker run -it --rm -v $FREEPLANE_PATH:/app/freeplane freeplane-builder gradle build
    fi
fi


