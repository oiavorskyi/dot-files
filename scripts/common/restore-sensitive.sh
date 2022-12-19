#!/usr/bin/env bash

source $MY_DIR/scripts/helpers/create-link.sh
ARCHIVE=$MY_DIR/sensitive-preferences-backup.tgz
PREFS_DIR=$MY_DIR/sensitive

if [ ! -f $ARCHIVE ]; then
    echo "Cannot find archive with sensitive preferences. Nothing to restore"
    exit 1
fi

# use custom mackup app definitions if they exist
if [[ -d $MY_DIR/mackup/.mackup ]]; then
    echo "Setting up custom mackup configuration"
    create_link mackup/.mackup .mackup
else
    echo "No custom mackup configuration found at ./mackup/.mackup. Skipping"
fi

# remove sensitive folder if it exists and unpack the archive
if [ -d $PREFS_DIR ]; then
    rm -rf $PREFS_DIR
fi
tar xzf $ARCHIVE -C $MY_DIR

# use sensitive mackup configuration
echo "Preparing to restoring sensitive configuration"
create_link mackup/.mackup.backup.sensitive.cfg .mackup.cfg

# restore with sensitive configuration
echo "Restoring sensitive configuration"
mackup --verbose --force restore

# remove linking to avoid issues in the future
mackup --verbose --force uninstall

# cleanup temporary directory
rm -rf $PREFS_DIR
