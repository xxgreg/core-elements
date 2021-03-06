//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_selection.test.multi;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart' show useHtmlConfiguration;
import 'package:core_elements/core_selection.dart';

void main() {
  useHtmlConfiguration();

  initPolymer().then((zone) => zone.run(() {
    Polymer.onReady.then((e) {

      group('core-selection', () {
        var s = querySelector('core-selection') as CoreSelection;

        test('select item', () {
          var func = (event) {
            expect(event.detail['isSelected'], true);
            expect(event.detail['item'], '(item1)');
            expect(s.isSelected(event.detail['item']), true);
            expect(s.getSelection().length, 1);
          };
          s.on['core-select'].take(1).listen(expectAsync(func));
          s.select('(item1)');
        });
        test('select null', () {
          var func = (event) {
            expect(event.detail['isSelected'], true);
            expect(event.detail['item'], '(item2)');
            expect(s.isSelected(event.detail['item']), true);
            expect(s.getSelection().length, 2);
          };
          s.on['core-select'].take(1).listen(expectAsync(func));
          s.select('(item2)');
        });

      });

    });
  }));
}
