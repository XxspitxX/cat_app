#!/bin/sh
cat <<EOF
Bloc Builder

**First Uppercase**
Define Class Name (IE: Family):
EOF

read name

ext="_bloc.dart"
test_ext="_bloc_test.dart"
SNAKE_NAME=$(echo $name | sed 's/\([A-Z]\)/_\1/g;s/^_//' | tr '[:upper:]' '[:lower:]')
filename=$(echo $SNAKE_NAME$ext)
filenameTest=$(echo $SNAKE_NAME$test_ext | tr '[:upper:]' '[:lower:]')
path="./modules/frameworks/ui/lib/blocs/"
test_path="./modules/frameworks/ui/test/"

BLOC_CLASS=$name"Bloc"

# include parse_yaml function
. scripts/parse_yaml.sh

eval $(parse_yaml pubspec.yaml "yaml_")

FILE=$path$filename
clear
echo "CREATING BLOC..."
if [ -f "$FILE" ]; then
cat <<EOF
  BLOC ALREADY EXISTS!!
    PATH: $FILE
EOF
else 

cat > $FILE << EOF
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ui/blocs/bloc.dart';

@injectable
class $BLOC_CLASS extends Bloc {
  final _exampleSubject = BehaviorSubject<String>();

  ValueStream<String> get example => _exampleSubject.stream;

  @override
  void dispose() {
    _exampleSubject.close();
  }
}
EOF

bloc=$name"Bloc"

cat > $test_path$filenameTest << EOF
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/blocs/$filename';

void main() {
  //TODO: Add unit test
  late $bloc _bloc;

  setUp(() {
    _bloc = $bloc();
  });
}
EOF
cat <<EOF
  BLOC CREATED
  PATH: $FILE
EOF

echo "CREATING PAGE..."

PAGE_PATH="./modules/frameworks/ui/lib/pages/"$SNAKE_NAME"_page.dart"
PAGE_CLASS=$name"Page"
PAGE_STATE="_"$PAGE_CLASS"State"
cat > $PAGE_PATH <<EOF
import 'package:flutter/material.dart';
import 'package:ui/blocs/$filename';
import 'package:ui/pages/base_state.dart';

class $PAGE_CLASS extends StatefulWidget {
  const $PAGE_CLASS({super.key});

  @override
  State<$PAGE_CLASS> createState() => $PAGE_STATE();
}

class $PAGE_STATE extends BaseState<$PAGE_CLASS, $BLOC_CLASS> {
  @override
  Widget build(BuildContext context) {
    //TODO: Create your page or widget
    return Scaffold();
  }
}
EOF
fi

# flutter packages pub run build_runner build --delete-conflicting-outputs