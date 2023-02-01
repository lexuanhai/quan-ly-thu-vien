using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien.Model
{
    public class Sach
    {
        public string MaSach { get; set; }
        public string TenSach { get; set; }
        public string MaTheLoai { get; set; }
        public string TenTheLoai { get; set; }
        public string MaTacGia { get; set; }
        public string TenTacGia { get; set; }
        public string MaNXB { get; set; }
        public string TenNXB { get; set; }
        public string MaViTri { get; set; }
        public int NamXB { get; set; }
        public int SLNhap { get; set; }
        public decimal TriGia { get; set; }
        public string TinhTrang { get; set; }
        public string Ghichu { get; set; }
        public DateTime? NgNhapSach { get; set; }
    }
}
