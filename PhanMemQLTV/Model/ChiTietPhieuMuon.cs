using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien.Model
{
    public class ChiTietPhieuMuon
    {
        public string MaCTPT { get; set; }
        public string MaPhieuMuon { get; set; }
        public string MaSach { get; set; }
        public string MaDG { get; set; }
        public DateTime NgayMuon { get; set; }
     
        public DateTime NgayTra { get; set; }
        public int SoLuong { get; set; }
        public string TinhTrang { get; set; }
        public string GhiChu { get; set; }
    }
}
