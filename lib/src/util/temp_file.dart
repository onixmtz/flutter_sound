/*
 * Copyright 2018, 2019, 2020 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3, as published by
 * the Free Software Foundation.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Flutter-Sound.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:io';

import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

/// Creates an path to a temporary file.
Future<String> tempFile({String suffix}) async {
  suffix ??= 'tmp';

  if (!suffix.startsWith('.')) {
    suffix = '.$suffix';
  }
  var uuid = Uuid();
  var tmpDir = await getTemporaryDirectory();
  var path = '${join(tmpDir.path, uuid.v4())}$suffix';
  var parent = dirname(path);
  Directory(parent).createSync(recursive: true);

  return path;
}
