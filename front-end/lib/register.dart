import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/login.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? selectedGender;
  PhoneNumber number = PhoneNumber(isoCode: 'ID');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24), // Spasi dari atas layar
                const Icon(Icons.arrow_back, size: 28), // Ikon back di kiri atas
                const SizedBox(height: 16), // Spasi antara ikon back dan teks Get Started
                // Menggunakan SizedBox dengan double.infinity dan Center untuk memastikan teks terpusat
                SizedBox(
                  width: double.infinity, // Memastikan SizedBox mengambil seluruh lebar yang tersedia
                  child: Center( // Memusatkan teks di dalam SizedBox
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
                const SizedBox(height: 12), // Spasi di bawah baris ikon dan teks
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
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: const AssetImage('assets/foto/PP.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.grey.shade400,
                          child: const Icon(Icons.add, size: 16, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                // Bagian Nama Lengkap
                  const SizedBox(height: 16),  // Ubah dari 30 ke 16
                  buildLabel('Nama Lengkap'),
                  const SizedBox(height: 8),
                  buildInputField('Enter your full name'),

                  // Bagian E-mail
                  const SizedBox(height: 16),
                  buildLabel('E-mail'),
                  const SizedBox(height: 8),
                  buildInputField('Enter your email'),

                  // Bagian Kata Sandi
                  const SizedBox(height: 16),
                  buildLabel('Kata Sandi'),
                  const SizedBox(height: 8),
                  buildIconInputField('Password', Icons.lock, obscure: true),

                const SizedBox(height: 16),
                buildLabel('Nomor Telepon'),
                const SizedBox(height: 8),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    // handle number change
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                  ),
                  initialValue: number,
                  textStyle: GoogleFonts.inter(fontSize: 12),
                  inputDecoration: InputDecoration(
                    hintText: 'Phone Number',
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),

                const SizedBox(height: 16),
                buildLabel('Jenis Kelamin'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildGenderOption('Laki - laki'),
                    const SizedBox(width: 20),
                    buildGenderOption('Perempuan'),
                  ],
                ),

                const SizedBox(height: 16),
                const BirthDateSelector(),

                const SizedBox(height: 16),
                buildLabel('Kartu Tanda Pengenal'),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: CustomPaint(
                    painter: DashedBorderPainter(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Icon(Icons.add, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Masukkan Foto KTP',
                            style: GoogleFonts.inter(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 34),
                Center(
                  child: SizedBox(
                  width: 210, // Ubah sesuai kebutuhan, misal 150, 180, dll.
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D3671),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Daftar Sekarang',
                      style: GoogleFonts.poppins(
                        fontSize: 12, // Ukuran font tetap kecil
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // Mengubah warna font menjadi putih
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
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
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500),
    );
  }

  Widget buildInputField(String hint, {bool obscure = false}) {
    return TextFormField(
      obscureText: obscure,
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
    );
  }

  Widget buildIconInputField(String hint, IconData icon, {bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
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
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class BirthDateSelector extends StatefulWidget {
  const BirthDateSelector({super.key});

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
              setState(() => selectedMonth = val);
            })),
            const SizedBox(width: 8),
            Expanded(child: _buildDropdown('Date', selectedDate, days, (val) {
              setState(() => selectedDate = val);
            })),
            const SizedBox(width: 8),
            Expanded(child: _buildDropdown('Year', selectedYear, years, (val) {
              setState(() => selectedYear = val);
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
        style: GoogleFonts.inter(color: Colors.grey, fontSize: 12) // Menambahkan fontSize: 12
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
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

  DashedBorderPainter({
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 6.0, // Panjang setiap dash
    this.dashSpace = 6.0, // Panjang spasi antar dash
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path path = Path();

    // Gambar dash di sisi atas
    double currentX = 0;
    while (currentX < size.width) {
      path.moveTo(currentX, 0);
      double endX = currentX + dashWidth;
      if (endX > size.width) {
        endX = size.width; // Pastikan dash terakhir tidak melebihi batas
      }
      path.lineTo(endX, 0);
      currentX += dashWidth + dashSpace;
    }

    // Gambar dash di sisi kanan
    double currentY = 0;
    while (currentY < size.height) {
      path.moveTo(size.width, currentY);
      double endY = currentY + dashWidth;
       if (endY > size.height) {
        endY = size.height; // Pastikan dash terakhir tidak melebihi batas
      }
      path.lineTo(size.width, endY);
      currentY += dashWidth + dashSpace;
    }

    // Gambar dash di sisi bawah
    currentX = size.width;
    while (currentX > 0) {
      path.moveTo(currentX, size.height);
      double endX = currentX - dashWidth;
      if (endX < 0) {
        endX = 0; // Pastikan dash terakhir tidak melebihi batas
      }
      path.lineTo(endX, size.height);
      currentX -= dashWidth + dashSpace;
    }

    // Gambar dash di sisi kiri
    currentY = size.height;
    while (currentY > 0) {
      path.moveTo(0, currentY);
      double endY = currentY - dashWidth;
       if (endY < 0) {
        endY = 0; // Pastikan dash terakhir tidak melebihi batas
      }
      path.lineTo(0, endY);
      currentY -= dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // Repaint jika ada properti yang berubah
    return oldDelegate is DashedBorderPainter &&
        (oldDelegate.color != color ||
         oldDelegate.strokeWidth != strokeWidth ||
         oldDelegate.dashWidth != dashWidth ||
         oldDelegate.dashSpace != dashSpace);
  }
}

