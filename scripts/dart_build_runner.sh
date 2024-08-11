#!/bin/sh

cat <<EOF
Run dart build runner

Select module:

    1. all
    2. root
    3. ui
    4. domain
    5. data
    6. api_source
    7. models
    0. Cancel
EOF

read option

if [ $option = 1 ]; then
    ./scripts/dart_build_runner_all_modules.sh
elif [ $option = 2 ]; then
    dart run build_runner build --delete-conflicting-outputs
elif [ $option = 3 ]; then
    cd modules/frameworks/ui
    dart run build_runner build --delete-conflicting-outputs
    cd ../../../
elif [ $option = 4 ]; then
    cd modules/domain
    dart run build_runner build --delete-conflicting-outputs
    cd ../../
elif [ $option = 5 ]; then
    cd modules/data
    dart run build_runner build --delete-conflicting-outputs
    cd ../../
elif [ $option = 6 ]; then
    cd modules/frameworks/api_source
    dart run build_runner build --delete-conflicting-outputs
    cd ../../../

elif [ $option = 7 ]; then
    cd modules/models
    dart run build_runner build --delete-conflicting-outputs
    cd ../../

else
    echo 'Invalid option'
fi