
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studylog_flutter/main.dart';

Future<void> isiField(
  WidgetTester tester,
  String key,
  String nilai,
) async {
  final field = find.byKey(Key(key));
  await tester.ensureVisible(field);
  await tester.enterText(field, nilai);
}

Future<void> isiValid(WidgetTester tester) async {
  await isiField(
    tester,
    'mataKuliah',
    'Pemrograman Aplikasi Bergerak',
  );
  await isiField(tester, 'judul', 'Form Flutter');
  await isiField(tester, 'topik', 'State');
  await isiField(
    tester,
    'isi',
    'setState memperbarui antarmuka.',
  );
}

Future<void> tampilkan(WidgetTester tester) async {
  final tombol = find.byKey(const Key('tampilkan'));
  await tester.ensureVisible(tombol);
  await tester.tap(tombol);
  await tester.pump();
}

void main() {
  testWidgets('M1-T1: semua field kosong ditolak', (
    tester,
  ) async {
    await tester.pumpWidget(const StudyLogApp());
    await tampilkan(tester);

    expect(find.text('Mata kuliah wajib diisi'), findsOneWidget);
    expect(find.text('Judul wajib diisi'), findsOneWidget);
    expect(find.text('Topik wajib diisi'), findsOneWidget);
    expect(find.text('Isi catatan wajib diisi'), findsOneWidget);
    expect(find.byKey(const Key('hasilCard')), findsNothing);
  });

  testWidgets('M1-T2: input spasi ditolak', (tester) async {
    await tester.pumpWidget(const StudyLogApp());
    await isiValid(tester);
    await isiField(tester, 'judul', '   ');
    await tampilkan(tester);

    expect(find.text('Judul wajib diisi'), findsOneWidget);
    expect(find.byKey(const Key('hasilCard')), findsNothing);
  });

  testWidgets(
    'M1-T3: input valid menampilkan Card dan SnackBar',
    (tester) async {
      await tester.pumpWidget(const StudyLogApp());
      await isiValid(tester);
      await tampilkan(tester);

      await tester.ensureVisible(
        find.byKey(const Key('hasilTeks')),
      );

      expect(
        find.byKey(const Key('hasilCard')),
        findsOneWidget,
      );
      expect(
        find.textContaining('Judul: Form Flutter'),
        findsOneWidget,
      );
      expect(
        find.textContaining('Topik: State'),
        findsOneWidget,
      );

      final hasil = tester.widget<Text>(
        find.byKey(const Key('hasilTeks')),
      );

      expect(
        hasil.data,
        contains('setState memperbarui antarmuka.'),
      );
      expect(find.byType(SnackBar), findsOneWidget);
    },
  );

  testWidgets('M1-T4: judul pada Card diperbarui', (
    tester,
  ) async {
    await tester.pumpWidget(const StudyLogApp());
    await isiValid(tester);
    await tampilkan(tester);

    await isiField(tester, 'judul', 'Validasi Flutter');
    await tampilkan(tester);

    await tester.ensureVisible(
      find.byKey(const Key('hasilTeks')),
    );

    expect(
      find.textContaining('Judul: Validasi Flutter'),
      findsOneWidget,
    );
    expect(
      find.textContaining('Judul: Form Flutter'),
      findsNothing,
    );
  });

  testWidgets('M1-T5: topik dua karakter ditolak', (
    tester,
  ) async {
    await tester.pumpWidget(const StudyLogApp());
    await isiValid(tester);
    await isiField(tester, 'topik', ' ab ');
    await tampilkan(tester);

    expect(
      find.text('Topik minimal 3 karakter'),
      findsOneWidget,
    );
    expect(find.byKey(const Key('hasilCard')), findsNothing);
  });

  testWidgets(
    'M1-T6: topik tiga karakter dan indikator sukses',
    (tester) async {
      await tester.pumpWidget(const StudyLogApp());
      await isiValid(tester);
      await isiField(tester, 'topik', ' API ');
      await tampilkan(tester);

      expect(
        find.text('Berhasil Ditampilkan'),
        findsOneWidget,
      );
      expect(
        find.byIcon(Icons.check_circle),
        findsOneWidget,
      );

      final tombol = tester.widget<FilledButton>(
        find.byKey(const Key('tampilkan')),
      );

      expect(
        tombol.style!.backgroundColor!.resolve({}),
        Colors.green.shade700,
      );

      await tester.ensureVisible(
        find.byKey(const Key('hasilTeks')),
      );

      final hasil = tester.widget<Text>(
        find.byKey(const Key('hasilTeks')),
      );

      expect(hasil.data, contains('Topik: API'));
    },
  );

  testWidgets(
    'M1-T7: mengedit input mengembalikan indikator tombol',
    (tester) async {
      await tester.pumpWidget(const StudyLogApp());
      await isiValid(tester);
      await tampilkan(tester);

      expect(
        find.text('Berhasil Ditampilkan'),
        findsOneWidget,
      );
      expect(
        find.byIcon(Icons.check_circle),
        findsOneWidget,
      );

      await isiField(tester, 'judul', 'Judul baru');
      await tester.pump();

      expect(
        find.byKey(const Key('tampilkan')),
        findsOneWidget,
      );
      expect(
        find.text('Tampilkan Catatan'),
        findsOneWidget,
      );
      expect(
        find.byIcon(Icons.save),
        findsOneWidget,
      );
    },
  );
}
