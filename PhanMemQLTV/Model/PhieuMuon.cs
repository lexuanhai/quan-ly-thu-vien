using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PhanMemQLTV.Model
{
    public class PhieuMuon
    {
        public string MaPhieu { get; set; }
        public string MaThuThu { get; set; }
        public string MaDG { get; set; }
        public string TenDG { get; set; }
        public string TenThuThu { get; set; }
        public int SLMuon { get; set; }
        public string TinhTrang { get; set; }
        public string Ghichu { get; set; }
    }
    public class TongSo
    {
        public int TongSoNhap { get; set; }
        public int TongSoDangMuon { get; set; }
    }
}
