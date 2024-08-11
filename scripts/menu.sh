#!/bin/sh

cat <<EOF
Scripts Menu

Select Option:

    1. Clean project
    2. Package get
    3. Bloc builder
    4. Business flow
    5. Pub upgrade
    6. Test with coverage
    7. Dart build runner
    8. Gen L10n
    0. Exit
EOF

read option

if [ $option = 1 ]; then
    clear
    ./scripts/clean.sh
elif [ $option = 2 ]; then
    clear
    ./scripts/package_get.sh
elif [ $option = 3 ]; then
    clear
    ./scripts/bloc.sh
elif [ $option = 4 ]; then
    clear
    ./scripts/business_flow.sh
elif [ $option = 5 ]; then
    clear
    ./scripts/pub_upgrade.sh
elif [ $option = 6 ]; then
    clear
    ./scripts/test.sh
elif [ $option = 7 ]; then
    clear
    ./scripts/dart_build_runner.sh
elif [ $option = 8 ]; then
    clear
    ./scripts/gen_l10n.sh

else
    echo 'Invalid option'
fi
