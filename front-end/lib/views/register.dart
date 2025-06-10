import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Perbaiki import: 'package:flutter_bloc/flutter_bloc.dart'
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:ui'; // Tambahkan import ini untuk PathMetrics

import 'package:register/BLoC/register_bloc.dart';
import 'package:register/BLoC/register_event.dart';
import 'package:register/BLoC/register_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'ID');
  String? selectedGender;
  DateTime? _selectedDate;
  String? _idPhotoPath; // Simulasi foto KTP - diubah menjadi nullable

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Method untuk menampilkan snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => RegisterBloc(),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            } else {
              Navigator.of(context, rootNavigator: true).pop(); // Tutup loading
            }

            if (state is RegisterSuccess) {
              _showSnackBar('Registrasi berhasil!');
            }

            if (state is RegisterFailure) {
              _showSnackBar(state.message);
            }
          },
          child: SafeArea(
            child: Stack( // Menggunakan Stack untuk positioning absolut
              children: [
                // Icon Arrow Back (posisi tetap di kiri atas)
                Positioned(
                  top: 24, // Padding dari atas
                  left: 24, // Padding dari kiri
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Contoh: kembali ke halaman sebelumnya
                    },
                    child: Image.asset(
                      'assets/foto/backbutton.png', // Ganti dengan path aset Anda
                      width: 28, // Sesuaikan ukuran sesuai kebutuhan
                      height: 28, // Sesuaikan ukuran sesuai kebutuhan
                    ),
                  ),
                ),

                // Teks "Get Started" (posisi di tengah secara horizontal)
                Positioned(
                  top: 24 + 28 + 16, // Penyesuaian posisi agar tidak bertabrakan dengan ikon panah
                  left: 0,
                  right: 0,
                  child: Center( // Center widget untuk menengahkan teks secara horizontal
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // Konten formulir yang dapat digulir
                Positioned.fill(
                  // Mengatur padding atas untuk memastikan konten tidak tumpang tindih
                  // dengan ikon panah dan teks "Get Started"
                  // 24 (top padding arrow) + 28 (arrow height) + 16 (spacing setelah arrow)
                  // + 28 (approx. 'Get Started' text height) + 12 (spacing setelah 'Get Started')
                  top: 24 + 28 + 16 + 28 + 12 + 10, // Tambahkan sedikit ruang ekstra
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24), // Padding horizontal
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Konten formulir dimulai di sini
                            Text(
                              'Registrasi',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Silahkan registrasi untuk login',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 30),

                            const SizedBox(height: 16),
                            buildLabel('Nama Lengkap'),
                            const SizedBox(height: 8),
                            buildInputField('Enter your full name', _fullNameController),

                            const SizedBox(height: 16),
                            buildLabel('E-mail'),
                            const SizedBox(height: 8),
                            buildInputField('Enter your email', _emailController),

                            const SizedBox(height: 16),
                            buildLabel('Kata Sandi'),
                            const SizedBox(height: 8),
                            buildIconInputField('Password', Icons.lock, _passwordController, obscure: true),

                            const SizedBox(height: 16),
                            buildLabel('Nomor Telepon'),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  this.number = number;
                                },
                                selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DROPDOWN,
                                  setSelectorButtonAsPrefixIcon: true,
                                ),
                                initialValue: number,
                                textStyle: GoogleFonts.inter(fontSize: 12),
                                inputDecoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  hintStyle: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  prefixIcon: const Icon(Icons.phone, color: Colors.black),
                                ),
                                keyboardType: TextInputType.number,
                                inputBorder: InputBorder.none,
                              ),
                            ),

                            const SizedBox(height: 16),
                            buildLabel('Jenis Kelamin'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildGenderOption('Laki - laki'),
                                const SizedBox(width: 20),
                                buildGenderOption('Perempuan'),
                              ],
                            ),

                            const SizedBox(height: 16),
                            BirthDateSelector(onDateSelected: (date) {
                              setState(() {
                                _selectedDate = date;
                              });
                            }),

                            const SizedBox(height: 16),
                            buildLabel('Kartu Tanda Pengenal'),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _idPhotoPath = 'path/to/selected_photo.jpg';
                                });
                                _showSnackBar('Foto KTP berhasil dipilih (simulasi)!');
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.transparent, width: 0),
                                ),
                                child: CustomPaint(
                                  painter: DashedBorderPainter(borderRadius: 12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(_idPhotoPath == null ? Icons.add : Icons.check_circle,
                                            size: 20, color: _idPhotoPath == null ? Colors.black : Colors.green),
                                        const SizedBox(width: 8),
                                        Text(
                                          _idPhotoPath == null ? 'Masukkan Foto KTP' : 'Foto KTP Terpilih',
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: _idPhotoPath == null ? Colors.black : Colors.green),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 34),
                            Center(
                              child: SizedBox(
                                width: 210,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (selectedGender == null) {
                                        _showSnackBar('Pilih jenis kelamin Anda.');
                                      } else if (_selectedDate == null) {
                                        _showSnackBar('Lengkapi tanggal lahir Anda.');
                                      } else if (_idPhotoPath == null) {
                                        _showSnackBar('Masukkan foto KTP Anda.');
                                      } else {
                                        context.read<RegisterBloc>().add(RegisterSubmitted(
                                              fullName: _fullNameController.text,
                                              email: _emailController.text,
                                              password: _passwordController.text,
                                              phoneNumber: number.phoneNumber ?? '',
                                              gender: selectedGender!,
                                              birthDate: _selectedDate!.toIso8601String().split('T')[0],
                                              idPhotoPath: _idPhotoPath!,
                                            ));
                                      }
                                    } else {
                                      _showSnackBar('Lengkapi semua data yang diperlukan.');
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1D3671),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Daftar Sekarang',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sudah memiliki akun? ',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Navigasi ke halaman login, misalnya:
                                    // context.go('/login');
                                  },
                                  child: Text(
                                    'Masuk',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF1D3671),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Widget helper methods (buildLabel, buildInputField, etc.) ---
  Widget buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500),
    );
  }

  Widget buildInputField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade300,
        hintStyle: GoogleFonts.inter(
          color: Colors.grey,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      validator: (value) => value!.isEmpty ? 'Field tidak boleh kosong' : null,
    );
  }

  Widget buildIconInputField(String hint, IconData icon, TextEditingController controller,
      {bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            color: Colors.grey,
            fontSize: 12,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        validator: (value) => value!.isEmpty ? 'Field tidak boleh kosong' : null,
      ),
    );
  }

  Widget buildGenderOption(String gender) {
    return Row(
      children: [
        Radio<String>(
          value: gender,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        Text(
          gender,
          style: GoogleFonts.inter(
            fontSize: 12, // Mengubah ukuran font menjadi 12
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class BirthDateSelector extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const BirthDateSelector({super.key, required this.onDateSelected});

  @override
  State<BirthDateSelector> createState() => _BirthDateSelectorState();
}

class _BirthDateSelectorState extends State<BirthDateSelector> {
  String? selectedMonth;
  String? selectedDate;
  String? selectedYear;

  List<String> days = List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));
  List<String> years = List.generate(80, (index) => (DateTime.now().year - index).toString());
  final List<String> months = const [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  // Method untuk memeriksa dan memanggil onDateSelected
  void _checkAndSetDate() {
    if (selectedMonth != null && selectedDate != null && selectedYear != null) {
      try {
        final birthDate = DateTime(
          int.parse(selectedYear!),
          months.indexOf(selectedMonth!) + 1,
          int.parse(selectedDate!),
        );
        widget.onDateSelected(birthDate);
      } catch (e) {
        // Handle invalid date combinations if necessary (e.g., Feb 30th)
        // For simplicity, we just won't call onDateSelected for invalid dates
        print('Invalid date combination: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tanggal Lahir', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildDropdown('Month', selectedMonth, months, (val) {
              setState(() {
                selectedMonth = val;
                _checkAndSetDate(); // Panggil saat nilai berubah
              });
            })),
            const SizedBox(width: 8),
            Expanded(child: _buildDropdown('Date', selectedDate, days, (val) {
              setState(() {
                selectedDate = val;
                _checkAndSetDate(); // Panggil saat nilai berubah
              });
            })),
            const SizedBox(width: 8),
            Expanded(child: _buildDropdown('Year', selectedYear, years, (val) {
              setState(() {
                selectedYear = val;
                _checkAndSetDate(); // Panggil saat nilai berubah
              });
            })),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: const InputDecoration(border: InputBorder.none),
        isExpanded: true,
        hint: Text(
          hint,
          style: GoogleFonts.inter(color: Colors.grey, fontSize: 12),
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius; // Add borderRadius parameter

  DashedBorderPainter({
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 6.0,
    this.dashSpace = 6.0,
    this.borderRadius = 0.0, // Default to 0 if not provided
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rRect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );

    // Create a Path from the RRect
    Path path = Path();
    path.addRRect(rRect);

    PathMetrics pathMetrics = path.computeMetrics();

    Path dashedPath = Path(); // Path baru untuk menyimpan garis putus-putus
    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0;
      while (distance < pathMetric.length) {
        double end = distance + dashWidth;
        if (end > pathMetric.length) {
          end = pathMetric.length; // Pastikan tidak melebihi panjang path
        }
        dashedPath.addPath(
          pathMetric.extractPath(distance, end),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashedPath, paint); // Gambar path yang sudah putus-putus
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate is DashedBorderPainter &&
        (oldDelegate.color != color ||
            oldDelegate.strokeWidth != strokeWidth ||
            oldDelegate.dashWidth != dashWidth ||
            oldDelegate.dashSpace != dashSpace ||
            oldDelegate.borderRadius != borderRadius); // Include borderRadius in shouldRepaint
  }
}
