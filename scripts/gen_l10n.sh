#!/bin/sh

cat <<EOF
Flutter Setup

Running user_interface gen l10n...
EOF
cd modules/frameworks/user_interface/
flutter gen-l10n
cd ../../..