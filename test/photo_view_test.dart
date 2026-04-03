import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/src/utils/photo_view_utils.dart';

void main() {
  group('PhotoViewComputedScale', () {
    test('contained covered', () {
      expect(PhotoViewComputedScale.contained.toString(), contains('contained'));
      expect(PhotoViewComputedScale.covered.toString(), contains('covered'));
    });

    test('operator *', () {
      final s = PhotoViewComputedScale.contained * 2.0;
      expect(s.multiplier, 2.0);
    });

    test('operator /', () {
      final s = PhotoViewComputedScale.contained / 2.0;
      expect(s.multiplier, 0.5);
    });

    test('== hashCode', () {
      expect(PhotoViewComputedScale.contained, PhotoViewComputedScale.contained);
      expect(PhotoViewComputedScale.contained, isNot(PhotoViewComputedScale.covered));
    });
  });

  group('getScaleForScaleState', () {
    test('initial', () {
      final boundaries = ScaleBoundaries(
        0.5,
        4.0,
        1.0,
        const Size(100, 100),
        const Size(200, 200),
      );
      final scale = getScaleForScaleState(
        PhotoViewScaleState.initial,
        boundaries,
      );
      expect(scale, inInclusiveRange(0.5, 4.0));
    });

    test('originalSize', () {
      final boundaries = ScaleBoundaries(
        0.5,
        4.0,
        1.0,
        const Size(100, 100),
        const Size(200, 200),
      );
      final scale = getScaleForScaleState(
        PhotoViewScaleState.originalSize,
        boundaries,
      );
      expect(scale, 1.0);
    });
  });

  group('ScaleBoundaries', () {
    test('double min max initial', () {
      final b = ScaleBoundaries(
        0.5,
        4.0,
        1.0,
        const Size(100, 100),
        const Size(200, 200),
      );
      expect(b.minScale, 0.5);
      expect(b.maxScale, 4.0);
      expect(b.initialScale, 1.0);
    });
  });

  group('CornersRange', () {
    test('min max', () {
      const r = CornersRange(0.0, 1.0);
      expect(r.min, 0.0);
      expect(r.max, 1.0);
    });
  });
}
