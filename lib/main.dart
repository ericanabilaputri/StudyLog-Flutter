import 'package:flutter/material.dart';

void main() => runApp(const StudyLogApp());

class StudyLogApp extends StatelessWidget {
  const StudyLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyLog | Praktikum 1',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const CatatanFormSederhana(),
    );
  }
}

class CatatanFormSederhana extends StatefulWidget {
  const CatatanFormSederhana({super.key});

  @override
  State<CatatanFormSederhana> createState() =>
      _CatatanFormSederhanaState();
}

class _CatatanFormSederhanaState
    extends State<CatatanFormSederhana> {
  final _formKey = GlobalKey<FormState>();
  final _mataKuliah = TextEditingController();
  final _judul = TextEditingController();
  final _topik = TextEditingController();
  final _isi = TextEditingController();
  String? _hasil;
  bool _berhasil = false;

  @override
  void dispose() {
    _mataKuliah.dispose();
    _judul.dispose();
    _topik.dispose();
    _isi.dispose();
    super.dispose();
  }

  String? _wajib(String? nilai, String label) {
    if (nilai == null || nilai.trim().isEmpty) {
      return '$label wajib diisi';
    }
    return null;
  }

  void _inputBerubah(String _) {
    if (_berhasil) {
      setState(() => _berhasil = false);
    }
  }

  void _simpanSementara() {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() {
      _hasil = 'Mata kuliah: ${_mataKuliah.text.trim()}\n'
          'Judul: ${_judul.text.trim()}\n'
          'Topik: ${_topik.text.trim()}\n\n'
          '${_isi.text.trim()}';
      _berhasil = true;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(
        content: Text(
          'Data ditampilkan (belum tersimpan permanen).',
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StudyLog - Form Catatan')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Praktikum 1: State & Interaksi',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Catatan hanya tersimpan sementara di memori.'),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: const Key('mataKuliah'),
                  controller: _mataKuliah,
                  decoration: const InputDecoration(
                    labelText: 'Mata kuliah',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _inputBerubah,
                  validator: (v) => _wajib(v, 'Mata kuliah'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('judul'),
                  controller: _judul,
                  decoration: const InputDecoration(
                    labelText: 'Judul catatan',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _inputBerubah,
                  validator: (v) => _wajib(v, 'Judul'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('topik'),
                  controller: _topik,
                  decoration: const InputDecoration(
                    labelText: 'Topik',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _inputBerubah,
                  validator: (v) {
                    final error = _wajib(v, 'Topik');
                    if (error != null) return error;
                    if (v!.trim().length < 3) {
                      return 'Topik minimal 3 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('isi'),
                  controller: _isi,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Isi catatan',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _inputBerubah,
                  validator: (v) => _wajib(v, 'Isi catatan'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          FilledButton.icon(
            key: const Key('tampilkan'),
            onPressed: _simpanSementara,
            style: FilledButton.styleFrom(
              backgroundColor: _berhasil ? Colors.green.shade700 : null,
              foregroundColor: _berhasil ? Colors.white : null,
            ),
            icon: Icon(_berhasil ? Icons.check_circle : Icons.save),
            label: Text(_berhasil
                ? 'Berhasil Ditampilkan'
                : 'Tampilkan Catatan'),
          ),
          if (_hasil != null) ...[
            const SizedBox(height: 18),
            Card(
              key: const Key('hasilCard'),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hasil terakhir yang valid'),
                    const SizedBox(height: 8),
                    Text(_hasil!, key: const Key('hasilTeks')),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
