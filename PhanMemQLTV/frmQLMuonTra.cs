using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;
using QuanLyThuVien.Model;
using System.Reflection;
using System.Text.RegularExpressions;

namespace QuanLyThuVien
{
    public partial class frmQLMuonTra : Form
    {
        public frmQLMuonTra()
        {
            InitializeComponent();
        }

        //public int xuly;
        Common common = new Common();
        string MaCTPM = "";
        // load combox
        public void Loadcmb()
        {
            CmbDocGia();
            CmbThuThu();
            CmbSach();
            CmbPhieuMuon();

            txtTenDocGia.Enabled = false;
            txtThuThu.Enabled = false;
            txtTongSoLuongMuon.Enabled = false;

            txtTenTacGia.Enabled = false;
            txtTheLoai.Enabled = false;
            txtSoLuong.Enabled = false;
            txtSoLuongCon.Enabled = false;
        }
        public TongSo GetsoLuongTongSoLuongMuon(string ma)
        {
            DataTable dt;
            string query = "select sach.SLNhap,SUM(pm.SoLuong) as 'SoluongMuon' from tblSach sach inner join ChiTietPM pm on sach.MaSach = pm.MaSach where pm.MaSach = '" + ma+ "' and pm.TinhTrang =N'Đang Mượn' group by sach.SLNhap";
            dt = common.docdulieu(query);
           
            var lstTongSo = new List<TongSo>();
            if (dt != null && dt.Rows.Count > 0)
            {
                var tongso = new TongSo();
                tongso.TongSoNhap = dt.Rows[0]["SLNhap"] != null ? Convert.ToInt32(dt.Rows[0]["SLNhap"]) : 0;
                tongso.TongSoDangMuon = dt.Rows[0]["SoluongMuon"] != null ? Convert.ToInt32(dt.Rows[0]["SoluongMuon"]) : 0;
                return tongso;
            }
            return null;
        }
        public void CmbPhieuMuon()
        {
            DataTable dt;
            string query = "SELECT * FROM tblHSPhieuMuon ";
            dt = common.docdulieu(query);
            cmbMaPhieu.DisplayMember = "MaPhieu";
            cmbMaPhieu.ValueMember = "MaPhieu";
            cmbMaPhieu.DataSource = dt;
        }
        public void CmbSach()
        {
            DataTable dt;
            string query = "select * from tblSach";
            dt = common.docdulieu(query);
            cmbSach.DisplayMember = "TenSach";
            cmbSach.ValueMember = "MaSach";
            cmbSach.DataSource = dt;
        }
        public void CmbDocGia()
        {
            DataTable dt;
            string query = "select * from tblDocGia";
            dt = common.docdulieu(query);
            cmbDocGia.DisplayMember = "TenDG";
            cmbDocGia.ValueMember = "MaDG";
            cmbDocGia.DataSource = dt;
        }
        public void CmbThuThu()
        {
            DataTable dt;
            string query = "select * from tblThuThu";
            dt = common.docdulieu(query);
            cmbThuThu.DisplayMember = "TenTT";
            cmbThuThu.ValueMember = "MaTT";
            cmbThuThu.DataSource = dt;
        }

        public PhieuMuon GetPhieuMuonId(string ma)
        {
            DataTable dt;
            string query = "select * from tblHSPhieuMuon where MaPhieu='" + ma + "'";
            dt = common.docdulieu(query);
            var model = new PhieuMuon();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model.MaPhieu = dr["MaPhieu"].ToString();
                    model.MaThuThu = dr["MaThuThu"].ToString();
                    model.MaDG = dr["MaDG"].ToString();
                    model.SLMuon = dr["SLMuon"] != null ? Convert.ToInt32(dr["SLMuon"]):0;
                    model.TinhTrang = dr["TinhTrang"].ToString();
                    model.Ghichu = dr["GhiChu"].ToString();
                }
            }
            return model;
        }
        public ChiTietPhieuMuon GetChiTietPM(string ma)
        {
            DataTable dt;
            string query = "select *,phieumuon.MaDG as MaDG,ctpm.MaSach as MaSachPhieu, ctpm.TinhTrang as TinhTrangPhieu, ctpm.Ghichu as GhiChuPhieu from tblHSPhieuMuon phieumuon " +
                "inner join ChiTietPM ctpm on ctpm.MaPhieuMuon = phieumuon.MaPhieu " +
                "inner join tblDocGia docgia on phieumuon.MaDG = docgia.MaDG " +
                "inner join tblThuThu thuthu on phieumuon.MaThuThu = thuthu.MaTT where ctpm.MaCTPT = '"+ ma + "'";
        
            dt = common.docdulieu(query);

            var model = new ChiTietPhieuMuon();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model.MaCTPT = dr["MaCTPT"].ToString();
                    model.MaDG = dr["MaDG"].ToString();
                    model.MaPhieuMuon = dr["MaPhieuMuon"].ToString();
                    model.MaSach = dr["MaSachPhieu"].ToString();
                    model.SoLuong = dr["SoLuong"] != null ? Convert.ToInt32(dr["SoLuong"]) : 0;
                    if (dr["NgayMuon"] != null)
                    {
                        model.NgayMuon = Convert.ToDateTime(dr["NgayMuon"]);
                    }
                    if (dr["NgayTra"] != null)
                    {
                        model.NgayTra = Convert.ToDateTime(dr["NgayTra"]);
                    }
                    model.TinhTrang = dr["TinhTrang"].ToString();
                    model.GhiChu = dr["GhiChu"].ToString();
                }
            }
            return model;
        }
        public void LoadData(string qry = "")
        {
            DataTable dt;
            string query = "select *, phieumuon.TinhTrang as TinhTrangPhieu from tblHSPhieuMuon phieumuon " +
                "inner join tblDocGia docgia on phieumuon.MaDG = docgia.MaDG " +
                "inner join tblThuThu thuthu on phieumuon.MaThuThu = thuthu.MaTT";
            if (!string.IsNullOrEmpty(qry))
            {
                query += qry;
            }

            dt = common.docdulieu(query);

            dataGridViewPhieuMuon.Rows.Clear();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int n = dataGridViewPhieuMuon.Rows.Add();
                    dataGridViewPhieuMuon.Rows[n].Cells[0].Value = dr["MaPhieu"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[1].Value = dr["TenDG"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[2].Value = dr["TenTT"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[3].Value = dr["SLMuon"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[4].Value = dr["TinhTrangPhieu"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[5].Value = dr["GhiChu"].ToString();
                }
            }
        }

        public void LoadDataChiTietPhieuMuon(string qry = "")
        {
            DataTable dt;
            string query = "select *, phieumuon.TinhTrang as TinhTrangPhieu, phieumuon.Ghichu as GhiChuPhieu from tblHSPhieuMuon phieumuon " +
                "inner join ChiTietPM ctpm on ctpm.MaPhieuMuon = phieumuon.MaPhieu " +
                "inner join tblDocGia docgia on phieumuon.MaDG = docgia.MaDG " +
                "inner join tblThuThu thuthu on phieumuon.MaThuThu = thuthu.MaTT";
            if (!string.IsNullOrEmpty(qry))
            {
                query += qry;
            }

            dt = common.docdulieu(query);

            dataGridViewDSMuon.Rows.Clear();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    
                    int n = dataGridViewDSMuon.Rows.Add();
                    dataGridViewDSMuon.Rows[n].Cells[0].Value = dr["MaCTPT"].ToString();
                    dataGridViewDSMuon.Rows[n].Cells[1].Value = dr["MaPhieuMuon"].ToString();
                    dataGridViewDSMuon.Rows[n].Cells[2].Value = dr["TenDG"].ToString();
                    dataGridViewDSMuon.Rows[n].Cells[3].Value = dr["MaSach"].ToString();
                    dataGridViewDSMuon.Rows[n].Cells[4].Value = dr["NgayMuon"].ToString();
                    dataGridViewDSMuon.Rows[n].Cells[5].Value = dr["NgayTra"].ToString();
                    dataGridViewDSMuon.Rows[n].Cells[6].Value = dr["SoLuong"].ToString();
                    dataGridViewDSMuon.Rows[n].Cells[7].Value = dr["TinhTrangPhieu"].ToString();
                    dataGridViewDSMuon.Rows[n].Cells[8].Value = dr["GhiChuPhieu"].ToString();
                }
            }
        }
        public void LoadDataChiTietSachMuon(string qry = "")
        {
            DataTable dt;
            string query = "select *,phieumuon.MaDG as MaDG ,ctpm.TinhTrang as TinhTrangTra, phieumuon.Ghichu as GhiChuPhieu from tblHSPhieuMuon phieumuon " +
                "inner join ChiTietPM ctpm on ctpm.MaPhieuMuon = phieumuon.MaPhieu " +
                "inner join tblDocGia docgia on phieumuon.MaDG = docgia.MaDG " +
                "inner join tblThuThu thuthu on phieumuon.MaThuThu = thuthu.MaTT where ctpm.TinhTrang = N'Đang Mượn' ";
            if (!string.IsNullOrEmpty(qry))
            {
                query += qry;
            }

            dt = common.docdulieu(query);

            dataGridViewSachMuon.Rows.Clear();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {

                    int n = dataGridViewSachMuon.Rows.Add();
                    dataGridViewSachMuon.Rows[n].Cells[0].Value = dr["MaCTPT"].ToString();
                    dataGridViewSachMuon.Rows[n].Cells[1].Value = dr["MaPhieuMuon"].ToString();
                    dataGridViewSachMuon.Rows[n].Cells[2].Value = dr["MaDG"].ToString();
                    dataGridViewSachMuon.Rows[n].Cells[3].Value = dr["MaSach"].ToString();
                    dataGridViewSachMuon.Rows[n].Cells[4].Value = dr["NgayMuon"].ToString();
                    dataGridViewSachMuon.Rows[n].Cells[5].Value = dr["NgayTra"].ToString();
                    dataGridViewSachMuon.Rows[n].Cells[6].Value = dr["NgayDenTra"].ToString();
                    dataGridViewSachMuon.Rows[n].Cells[7].Value = dr["SoLuong"].ToString();
                    dataGridViewSachMuon.Rows[n].Cells[8].Value = dr["TinhTrangTra"].ToString();
                }
            }
        }

        private void setControlsChiTietSachMuon(bool edit)
        {
            //txtMaPhieu.Enabled = edit;
            txtSoLuong.Enabled = edit;
            txtGhiChu.Enabled = edit;
            cmbDocGia.Enabled = edit;
            cmbThuThu.Enabled = edit;
            cmbTinhTrang.Enabled = edit;
        }
        public ChiTietPhieuMuon GetValueChiTietPM()
        {
            var model = new ChiTietPhieuMuon();
            model.MaPhieuMuon = cmbMaPhieu.SelectedValue != null ? cmbMaPhieu.SelectedValue.ToString() : "";
            model.MaSach = cmbSach.SelectedValue != null ? cmbSach.SelectedValue.ToString() : "";
            model.SoLuong = !string.IsNullOrEmpty(txtSoLuongMuon.Text) ? Convert.ToInt32(txtSoLuongMuon.Text) : 0;
            model.NgayMuon = dtNgayMuon.Value;
            model.NgayTra = dtNgayTra.Value;
            model.TinhTrang = cmbTinhTrangMuonSach.SelectedItem != null ? cmbTinhTrangMuonSach.SelectedItem.ToString() : "";
            model.GhiChu = txtGhiChu.Text;
            //  cmb
            //model.MaDG = cmbDocGia.SelectedValue != null ? cmbDocGia.SelectedValue.ToString() : "";
            //model.MaThuThu = cmbThuThu.SelectedValue != null ? cmbThuThu.SelectedValue.ToString() : "";

            return model;
        }

        public PhieuMuon GetValue()
        {
            var model = new PhieuMuon();
            model.MaPhieu = txtMaPhieu.Text;
            model.MaDG = cmbDocGia.SelectedValue != null ? cmbDocGia.SelectedValue.ToString() :"";
            model.MaThuThu = cmbThuThu.SelectedValue != null ? cmbThuThu.SelectedValue.ToString() : "";
            model.SLMuon = !string.IsNullOrEmpty(txtSoLuong.Text) ? Convert.ToInt32(txtSoLuong.Text) : 0;
            model.TinhTrang = cmbTinhTrang.SelectedItem != null ? cmbTinhTrang.SelectedItem.ToString() : "";
            model.Ghichu = txtGhiChu.Text;

            return model;
        }
        public void SetValue(PhieuMuon model)
        {
            cmbDocGia.SelectedValue = model.MaDG;
            cmbThuThu.SelectedValue = model.MaThuThu;
            txtSoLuong.Text = model.SLMuon > 0 ? model.SLMuon.ToString() : "";
            cmbTinhTrang.SelectedItem = model.TinhTrang;
            txtGhiChu.Text = model.Ghichu;
            txtMaPhieu.Text = model.MaPhieu;
        }
        public void SetValueChiTietPM(ChiTietPhieuMuon model)
        {
            cmbMaPhieu.SelectedValue = model.MaPhieuMuon;
            cmbSach.SelectedValue = model.MaSach;
            txtSoLuongMuon.Text = model.SoLuong > 0?  model.SoLuong.ToString():"" ;
            dtNgayMuon.Value = model.NgayMuon;
            dtNgayTra.Value = model.NgayTra;
            cmbTinhTrangMuonSach.SelectedItem = model.TinhTrang;
            txtGhiChu.Text = model.GhiChu;           
        }

        private void setControls(bool edit)
        {
            //txtMaPhieu.Enabled = edit;
            txtSoLuong.Enabled = edit;
            txtGhiChu.Enabled = edit;
            cmbDocGia.Enabled = edit;
            cmbThuThu.Enabled = edit;
            cmbTinhTrang.Enabled = edit;
        }
        private void setControlsChiTietPM(bool edit)
        {
            //txtMaPhieu.Enabled = edit;
            txtSoLuongMuon.Enabled = edit;
            txtGhiChuMuonSach.Enabled = edit;
            dtNgayTra.Enabled = edit;
            dtNgayMuon.Enabled = edit;
            cmbTinhTrangMuonSach.Enabled = edit;
        }
        public void SetValueNull()
        {
            txtMaPhieu.Text = "";
            txtSoLuong.Text = "";
            txtGhiChu.Text = "";
            //cmbDocGia.Text = "";
            //cmbThuThu.Text = "";
            //cmbTinhTrang.Text = "";
        }
        public void SetValueNullChiTietPM()
        {
            txtSoLuongMuon.Text = "";
            txtGhiChu.Text = "";
            //cmbDocGia.Text = "";
            //cmbThuThu.Text = "";
            //cmbTinhTrang.Text = "";
        }
        public void search()
        {
            //btnThem.Enabled = false;
            //if (radMaDG.Checked)
            //{
            //    string timkiem = "select * from tblTheLoai where MaTheLoai like '%" + txtNDTimKiem.Text + "%'";
            //    LoadData(timkiem);
            //}
            //else if (radTenDG.Checked)
            //{
            //    string timkiem = "select * from tblTheLoai where TenTheLoai like N'%" + txtNDTimKiem.Text + "%'";
            //    LoadData(timkiem);
            //}
        }


        //private void frmQLSach_Load(object sender, EventArgs e)
        //{
        //    Loadcmb();
        //    LoadData();
        //    setControls(false);
        //    //string cauTruyVan = "select * from tblSach";
        //    ////dataGridViewDSSach.DataSource = ketnoi(cauTruyVan);
        //    //dataGridViewDSSach.AutoGenerateColumns = false;
        //    ////myConnection.Close();
        //    //setControls(false);
        //    //dataGridViewDSSach.Enabled = true;
        //    //btnLuu.Enabled = false;
        //    //btnHuy.Enabled = false;
        //    //txtMaSach.Enabled = false;   
        //}

        //public string NgNhapSach, maSach, tenSach, tacGia, TheLoai, nXB, namXB, slNhap, TriGia, tinhTrang, ghiChu;
        //private void dataGridViewDSSach_RowEnter(object sender, DataGridViewCellEventArgs e)
        //{
        //    try
        //    {
        //        //int row = e.RowIndex;
        //        //dtmNgNhapSach.Text = myTable.Rows[row]["NgNhapSach"].ToString();
        //        //NgNhapSach = dtmNgNhapSach.Text;
        //        //txtMaSach.Text = myTable.Rows[row]["MaSach"].ToString();
        //        //maSach = txtMaSach.Text;
        //        //txtTenSach.Text = myTable.Rows[row]["TenSach"].ToString();
        //        //tenSach = txtTenSach.Text;
        //        //txtTheLoai.Text = myTable.Rows[row]["TheLoai"].ToString();
        //        //TheLoai = txtTheLoai.Text;
        //        //txtTacGia.Text = myTable.Rows[row]["TacGia"].ToString();
        //        //tacGia = txtTacGia.Text;
        //        //txtNXB.Text = myTable.Rows[row]["NXB"].ToString();
        //        //nXB = txtNXB.Text;
        //        //txtNamXB.Text = myTable.Rows[row]["NamXB"].ToString();
        //        //namXB = txtNamXB.Text;

        //        //txtSLNhap.Text = myTable.Rows[row]["SLNhap"].ToString();
        //        //slNhap = txtSLNhap.Text;
        //        //txtTriGia.Text = myTable.Rows[row]["TriGia"].ToString();
        //        //TriGia = txtTriGia.Text;
        //        //cboTinhTrang.Text = myTable.Rows[row]["TinhTrang"].ToString();
        //        //tinhTrang = cboTinhTrang.Text;
        //        //txtGhiChu.Text = myTable.Rows[row]["GhiChu"].ToString();
        //        //ghiChu = txtGhiChu.Text;
        //    }
        //    catch
        //    {

        //    }
        //}


        //private void btnThem_Click(object sender, EventArgs e)
        //{

        //    setControls(true);
        //    //txtMaNXB.Text = setMaDG();
        //    SetValueNull();
        //    txtMaPhieu.Focus();
        //    btnSua.Enabled = false;
        //    btnXoa.Enabled = false;
        //    btnThem.Enabled = false;
        //    btnLuu.Enabled = true;
        //    btnHuy.Enabled = true;
        //    xuly = 0;
        //}
        private void suaDG()
        {
            setControls(true);
            btnXoa.Enabled = false;
            btnSua.Enabled = false;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
            btnThem.Enabled = false;
            xuly = 1;
        }

        //private void btnSua_Click(object sender, EventArgs e)
        //{
        //    xuly = 1;
        //    suaDG();
        //    txtMaPhieu.Enabled = false;
          
        //}

        private void xoa()
        {

            if (!string.IsNullOrEmpty(txtMaPhieu.Text))
            {
                DialogResult dlr;
                dlr = MessageBox.Show("Bạn chắc chắn muốn xóa.", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.Yes)
                {
                    try
                    {
                        string qry = "DELETE FROM tblHSPhieuMuon WHERE MaPhieu='" + txtMaPhieu.Text + "'";
                        var status = common.thucthidulieu(qry);
                        if (status)
                        {
                            MessageBox.Show("Xóa thành công.", "Thông Báo");
                        }
                        else
                        {
                            MessageBox.Show("Xóa thất bại.", "Thông Báo");
                        }

                        LoadData();
                        SetValueNull();
                        //btnXoa.Enabled = false;
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Xóa thất bại.", "Thông Báo");
                    }
                }
            }
            else
            {
                MessageBox.Show("Vui lòng chọn mã sách .", "Thông Báo");
            }

        }
        //private void btnXoa_Click(object sender, EventArgs e)
        //{
        //    xoa();
        //}

        private void themSach()
        {
            try
            {
                //  string query = "set dateformat dmy; insert into tblSach values ('" + txtMaSach.Text + "','" + dtmNgNhapSach.Text + "', N'" + txtTenSach.Text + "',N'" + txtTheLoai.Text + "',N'" + txtTacGia.Text + "',N'" + txtNXB.Text + "','" + txtNamXB.Text + "','" + txtSLNhap.Text + "','" + txtTriGia.Text + "',N'" + cboTinhTrang.Text + "',N'" + txtGhiChu.Text + "')";
                //ketnoi(query);
                //myCommand.ExecuteNonQuery();
                MessageBox.Show("Thêm thành công.", "Thông Báo");
                // myConnection.Close();
            }
            catch
            {
            }
        }

        private void dataGridViewDSSach_CellClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void txtMaSach_TextChanged(object sender, EventArgs e)
        {

        }
        //private void btnLuu_Click(object sender, EventArgs e)
        //{
        //    if (txtMaPhieu.Text == "")
        //    {
        //        errTenSach.SetError(txtMaPhieu, "Vui lòng nhập Mã Phiếu");
        //    }
        //    else
        //    {
        //        errTenSach.Clear();
        //    }            

        //    if (xuly == 0)
        //    {
        //        ThemMoi();
        //    }
        //    else if (xuly == 1)
        //    {
        //        UpdataDatabase();
        //    }

        //    btnLuu.Enabled = false;
        //    btnHuy.Enabled = false;
        //    btnThem.Enabled = true;
        //    btnSua.Enabled = true;
        //    btnXoa.Enabled = true;
        //    setControls(false);
        //    SetValueNull();
        //    LoadData();
        //}
        public bool Exist(string ma)
        {
            if (!string.IsNullOrEmpty(ma))
            {

                string query = "select * from tblSach where MaSach ='" + ma + "'";

                DataTable dt = common.docdulieu(query);

                if (dt != null && dt.Rows.Count > 0)
                {
                    return true;
                }
            }
            return false;
        }

        private void ThemMoiChiTietPhieuMuon()
        {
            try
            {
                var model = GetValueChiTietPM();
                DataTable dt;
                string query = "select * from ChiTietPM where MaPhieuMuon='" + model .MaPhieuMuon+ "' and MaSach='"+model.MaSach+ "' and TinhTrang =N'Đang Mượn'";
                //string query = "select * from tblSach where MaSach='" + masach + "'";
                var common = new Common();
                dt = common.docdulieu(query);
                if (dt != null && dt.Rows.Count > 0)
                {
                    MessageBox.Show("Sách đã mượn vui lòng chọn sách khác.");
                    return;
                }
 
                string ma = common.tangMaTuDong("ChiTietPM", "CTPM");
                var qry = "Insert into ChiTietPM([MaCTPT] ," +
                    "[MaSach] ," +
                    "[MaPhieuMuon] ," +
                    "[SoLuong] ," +
                    "[NgayMuon] ," +
                    "[NgayTra] ," +
                    "[TinhTrang] ," +
                    "[GhiChu])values('" + ma + "'," +
                     "'" + model.MaSach + "'," +
                    "'" + model.MaPhieuMuon + "'," +
                    "" + model.SoLuong + "," +
                    "'" + model.NgayMuon + "'," +
                    "'" + model.NgayTra + "'," +
                    "N'" + model.TinhTrang + "'," +
                    "N'" + model.GhiChu + "')";


                var status = common.thucthidulieu(qry);
                if (status)
                {
                    MessageBox.Show("Thêm mới thành công.");
                }
                else
                {
                    MessageBox.Show("Thêm mới không thành công.");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Thêm mới không thành công.");
            }
        }

        private void ThemMoi()
        {
            try
            {
                //if (txtTenDG.Text == "")
                //{
                //    errTenDG.SetError(txtTenDG, "Vui lòng nhập Tên DG");
                //}
                //else
                //{
                //    errTenDG.Clear();
                //}

                //if (txtEmail.Text == "")
                //{
                //    errEmail.SetError(txtEmail, "Vui lòng nhập Email");
                //}
                //else
                //{
                //    errEmail.Clear();
                //}

                //if (txtDiaChi.Text == "")
                //{
                //    errDC.SetError(txtDiaChi, "Vui lòng nhập Địa chỉ");
                //}
                //else
                //{
                //    errDC.Clear();
                //}

                //if (txtTenTK.Text == "")
                //{
                //    errTenTK.SetError(txtTenTK, "Vui lòng nhập Tên TK");
                //}
                //else
                //{
                //    errTenTK.Clear();
                //}
                var model = GetValue();
                var common = new Common();
                string ma = common.tangMaTuDong("tblHSPhieuMuon", "PhieuMuon");
                var qry = "Insert into tblHSPhieuMuon([MaPhieu] ," +
                    "[MaThuThu] ," +
                    "[MaDG] ," +
                    "[SLMuon] ," +
                    "[TinhTrang] ," +
                    "[GhiChu])values('" + ma + "'," +
                     "'" + model.MaThuThu + "'," +
                    "'" + model.MaDG + "'," +
                    "" + model.SLMuon + "," +
                    "N'" + model.TinhTrang + "'," +
                    "N'" + model.Ghichu + "')";


                var status = common.thucthidulieu(qry);
                if (status)
                {
                    MessageBox.Show("Thêm mới thành công.");
                }
                else
                {
                    MessageBox.Show("Thêm mới không thành công.");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Thêm mới không thành công.");
            }
        }
        public void UpdataDatabase()
        {
            var model = GetValue();
            //txtMaPhieu.ReadOnly = true;
            string qry = "Update tblHSPhieuMuon set "+
                " [MaDG] = '" + model.MaDG + "', " +
                " [MaThuThu] = '" + model.MaThuThu + "', " +
                " [SLMuon]=" + model.SLMuon + " , " +
                " [TinhTrang]= N'" + model.TinhTrang + "'," +
                " [Ghichu]= N'" + model.Ghichu + "'" +
                " where MaPhieu = '" + model.MaPhieu + "'";
            var status = common.thucthidulieu(qry);
            if (status)
            {
                MessageBox.Show("Sửa thành công.");
            }
            else
            {
                MessageBox.Show("Sửa không thành công.");
            }
        }
        public void UpdataGiaHan()
        {
            string qry = "Update ChiTietPM set " +
                " [NgayTra] = '" + dtNgayTra.Value.ToString("yyyy-MM-dd") + "'" +
                " where MaCTPT = '" + MaCTPM + "'";
            var status = common.thucthidulieu(qry);
            if (status)
            {
                MessageBox.Show("Gia hạn thành công.");
            }
            else
            {
                MessageBox.Show("Gia hạn thành công.");
            }
        }

        public Sach GetSachId(string masach)
        {
            DataTable dt;
            string query = "select *, sach.TinhTrang as TinhTrangSach,sach.Ghichu as GhiChiSach from tblSach sach " +
                "inner join tblTheLoai theloai on theloai.MaTheLoai = sach.MaTheLoai " +
                "inner join tblNhaXuatBan nxb on nxb.MaNXB = sach.MaNXB " +
                "inner join tblTacGia tacgia on tacgia.MaTacGia = sach.MaTacGia where sach.MaSach ='" + masach + "'";
            //string query = "select * from tblSach where MaSach='" + masach + "'";
            dt = common.docdulieu(query);
            var model = new Sach();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model.MaSach = dr["MaSach"].ToString();
                    model.TenSach = dr["TenSach"].ToString(); 
                    model.MaTheLoai = dr["MaTheLoai"].ToString();
                    model.TenTheLoai = dr["TenTheLoai"].ToString();
                    model.MaTacGia = dr["MaTacGia"].ToString();
                    model.TenTacGia = dr["TenTG"].ToString();
                    model.SLNhap = dr["SLNhap"] != null ? Convert.ToInt32(dr["SLNhap"]) : 0;
                }
            }
            return model;
        }
        public PhieuMuon GetPhieuByMaPhieu(string ma)
        {
            DataTable dt;
            string query = "SELECT * FROM tblHSPhieuMuon phieumuon " +
                "inner join tblDocGia docgia on docgia.MaDG = phieumuon.MaDG" +
                " inner join tblThuThu thuthu on thuthu.MaTT = phieumuon.MaThuThu " +
                "where phieumuon.MaPhieu ='"+ma+"'";
            dt = common.docdulieu(query);
            var model = new PhieuMuon();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model.MaPhieu = dr["MaPhieu"].ToString();
                    model.TenDG = dr["TenDG"].ToString();
                    model.TenThuThu = dr["TenTT"].ToString();
                    model.SLMuon = dr["SLMuon"] != null ? Convert.ToInt32(dr["SLMuon"]) :0;
                }
            }
            return model;
        }


        //private void btnHuy_Click(object sender, EventArgs e)
        //{
        //    SetValueNull();
        //    btnLuu.Enabled = false;
        //    btnHuy.Enabled = false;
        //    btnThem.Enabled = true;
        //    btnSua.Enabled = true;
        //    btnXoa.Enabled = true;
        //    setControls(false);


        //    errTenSach.Clear();
        //    errCD.Clear();
        //    errTG.Clear();
        //    errNamXB.Clear();
        //    errNXB.Clear();
        //    errTriGia.Clear();
        //    errSLNhap.Clear();
        //    errTinhTrang.Clear();
        //}

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnLoadDS_Click(object sender, EventArgs e)
        {
            lblNhapCD.Text = "";
            lblNhapTriGia.Text = "";
            lblNhapSLCon.Text = "";
            lblNhapSLNhap.Text = "";
            lblNhapTenNXB.Text = "";
            lblNhapTenSach.Text = "";
            lblNhapTenTG.Text = "";
            lblNhapTinhTrang.Text = "";
            setControls(false);
            txtNDTimKiem.Text = "";
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            string cauTruyVan = "select * from tblSach";
            // dataGridViewDSSach.DataSource = ketnoi(cauTruyVan);
            dataGridViewPhieuMuon.AutoGenerateColumns = false;
            //myConnection.Close();
        }
        private void timKiemSach()
        {
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            if (radMaSachMuon.Checked)
            {
                string timkiemMS = " where ctpm.MaSach ='" + txtNDTimKiem.Text + "'";
                LoadDataChiTietPhieuMuon(timkiemMS);
                //LoadData(timkiemMS);
            }
            else if (radTenDGMuon.Checked)
            {
                //string timkiemTS = "select * from tblSach where TenSach like N'%" + txtNDTimKiem.Text + "%'";

                string timkiemMS = " where docgia.TenDG like N'%" + txtNDTimKiem.Text + "%'";
                LoadDataChiTietPhieuMuon(timkiemMS);
                //LoadData(timkiemMS);
            }
            else
            {
                LoadDataChiTietPhieuMuon();
            }
            //else if (radTenTG.Checked)
            //{
            //    string timkiemMS = " where tacgia.TenTG like N'%" + txtNDTimKiem.Text + "%'";
            //    LoadData(timkiemMS);

            //}
            //else if (radTenCD.Checked)
            //{
            //    string timkiemMS = "select * from tblSach where TheLoai like N'%" + txtNDTimKiem.Text + "%'";

            //}
        }
        private void txtNDTimKiem_TextChanged(object sender, EventArgs e)
        {
            timKiemSach();
        }
        public string tangMaTuDong()
        {
            //  string cauTruyVan = "select * from tblSach";
            ////  dataGridViewDSSach.DataSource = ketnoi(cauTruyVan);
            //  dataGridViewDSSach.AutoGenerateColumns = false;
            //  myConnection.Close();
            //  string maTuDong = "";
            //  if(myTable.Rows.Count<=0)
            //  {
            //      maTuDong = "MS001";
            //  }
            //  else
            //  {
            //      int k;
            //      maTuDong = "MS";
            //      k = Convert.ToInt32(myTable.Rows[myTable.Rows.Count - 1][0].ToString().Substring(2, 3));
            //      k = k + 1;
            //      if(k<10)
            //      {
            //          maTuDong = maTuDong + "00";
            //      }
            //      else if(k<100)
            //      {
            //          maTuDong = maTuDong + "0";
            //      }
            //      maTuDong = maTuDong + k.ToString();
            //  }
            //  return maTuDong;
            return "";
        }




        // Khai báo
        string strKetNoi = ConfigurationManager.ConnectionStrings["strConn"].ConnectionString;
        private SqlConnection myConnection;
        private SqlDataAdapter myDataAdapter;
        private SqlCommand myCommand;
        private DataTable myTable;
    




        /// <summary>
        /// /////////////////////////////////////////////////
        /// </summary>
        private DataTable myTableSach;
        private DataTable myTableDG;
        private SqlDataReader myDataReaderSach;
        private SqlDataReader myDataReaderSLSachDaMuon;
        //private SqlDataReader myDataReaderMuonTra;
        //////////////////////////////////////////////////////////////////////////////////


        // Kết nối tới sql
        private DataTable ketnoi(string truyvan)
        {
            myConnection = new SqlConnection(strKetNoi);
            myConnection.Open();
            string thuchiencaulenh = truyvan;
            myCommand = new SqlCommand(thuchiencaulenh,myConnection);
            myDataAdapter = new SqlDataAdapter(myCommand);
            myTable=new DataTable();
            myDataAdapter.Fill(myTable);
            dataGridViewDSMuon.DataSource=myTable;
            return myTable;
        }

        // Kết nối tới tblSach
        private DataTable ketnoitblSach(string truyvan)
        {
            myConnection = new SqlConnection(strKetNoi);
            myConnection.Open();
            string thuchiencaulenh = truyvan;
            myCommand = new SqlCommand(thuchiencaulenh, myConnection);
            myDataAdapter = new SqlDataAdapter(myCommand);
            myTableSach = new DataTable();
            myDataAdapter.Fill(myTableSach);
            return myTableSach;
        }
        //cboMaSach0.SelectedIndex=dongcuoi;
        //int dongcuoi = myTableSach.Rows.Count+1;

        // Lấy mã sách lên cboMasach0
        //public void layMaSachMuon()
        //{ 
        //    string strLayMaSach = "select MaSach from tblSach";
        //    cboMaSach0.DataSource = ketnoitblSach(strLayMaSach);
        //    cboMaSach0.DisplayMember = "MaSach";
        //    cboMaSach0.ValueMember = "MaSach";
        //    myConnection.Close();
        //}

        // Kết nối tới tblDocGia
        private DataTable ketnoitblDocGia(string truyvan)
        {
            myConnection = new SqlConnection(strKetNoi);
            myConnection.Open();
            string thuchiencaulenh = truyvan;
            myCommand = new SqlCommand(thuchiencaulenh, myConnection);
            myDataAdapter = new SqlDataAdapter(myCommand);
            myTableDG = new DataTable();
            myDataAdapter.Fill(myTableDG);
            return myTableDG;
        }

        // lấy Mã DG lên cboMaDG
        //public void layMaDGMuon()
        //{
        //    string strLayMaDG = "select * from tblDocGia";
        //    cboMaDG0.DataSource = ketnoitblSach(strLayMaDG);
        //    cboMaDG0.DisplayMember = "MaDG";
        //    cboMaDG0.ValueMember = "MaDG";
        //    myConnection.Close();
        //}

        //private void setControlsMuon(bool edit)
        //{
        //    cboMaDG0.Enabled = edit;
        //    cboMaSach0.Enabled = edit;
        //    txtSoLuongMuonSach.Enabled = edit;
        //    //dtmNgayMuon0.Enabled = edit;
        //    //dtmNgayTra0.Enabled = edit;
        //    txtGhiChuMuonSach.Enabled = edit;
        //    dtNgayTra.Enabled = edit;
        //    dtNgayMuon.Enabled = edit;
        //    cmbTinhTrangMuonSach.Enabled = edit;
        //}

        private void frmQLMuonTra_Load(object sender, EventArgs e)
        {
            btnTraSach1.Enabled = false;
            LoadDataChiTietPhieuMuon();
            LoadDataChiTietSachMuon();
            Loadcmb();
            LoadData();
            setControls(false);
            //soSanhNgay();
            //string cauTruyVan = "select * from tblHSPhieuMuon";
            //dataGridViewDSMuon0.DataSource = ketnoi(cauTruyVan);
            //dataGridViewDSMuon0.AutoGenerateColumns = false;

            //dataGridViewDSMuon1.DataSource = ketnoi(cauTruyVan);
            //dataGridViewDSMuon1.AutoGenerateColumns = false;
            //myConnection.Close();

            //radMaDG.Checked = true;
            //radMaDG1.Checked = true;

            //btnChoMuon0.Text = "Cho Mượn";
            //btnChoMuon0.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            //btnChoMuon0.Enabled = false;
            //btnHuy0.Enabled = false;
            //txtMaPhieu0.Enabled = false;

            ////txtMaPhieu0.Enabled = false;
            //txtTTMaSach.Enabled = false;
            //txtTTTenSach.Enabled = false;
            //txtTTSLCon.Enabled = false;
            //txtTTTenTG.Enabled = false;
            ////dtmNgayTra0.Enabled = false;
            ////dtmNgayMuon0.Enabled = false;
            ////txtTinhTrang0.Enabled = false;

            //setControlsMuon(false);
            //setControlsTra(false);

            // không cho phép chỉnh sửa start
            txtMaPhieu.Enabled = false;
            // end
        }

        //public string maPhieu0, maDG0, maSach0, slMuon0, ngayMuon0, ngayTra0, ghiChu0, tinhTrang0;
        private void dataGridViewDSMuon0_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            //try
            //{
            //    int row = e.RowIndex;
            //    txtMaPhieu0.Text = myTable.Rows[row]["MaPhieu"].ToString();
            //    maPhieu0 = txtMaPhieu0.Text;
            //    cboMaDG0.Text = myTable.Rows[row]["MaDG"].ToString();
            //    maDG0 = cboMaDG0.Text;
            //    cboMaSach0.Text = myTable.Rows[row]["MaSach"].ToString();
            //    maSach0 = cboMaSach0.Text;
            //    txtSoLuongMuonSach.Text = myTable.Rows[row]["SLMuon"].ToString();
            //    slMuon0 = txtSoLuongMuonSach.Text;
            //    dtNgayMuon.Text = myTable.Rows[row]["NgayMuon"].ToString();
            //    ngayMuon0 = dtNgayMuon.Text;
            //    dtNgayTra.Text = myTable.Rows[row]["NgayTra"].ToString();
            //    ngayTra0 = dtNgayTra.Text;
            //    cmbTinhTrangMuonSach.Text = myTable.Rows[row]["TinhTrang"].ToString();
            //    tinhTrang0 = cmbTinhTrangMuonSach.Text;
            //    txtGhiChuMuonSach.Text = myTable.Rows[row]["GhiChu"].ToString();
            //    ghiChu0 = txtGhiChuMuonSach.Text;
            //}
            //catch (Exception)
            //{

            //}

        }

        //private void txtNDTimKiem_TextChanged(object sender, EventArgs e)
        //{
        //    setControlsMuon(false);
        //    btnNhap.Enabled = false;
        //    btnChoMuon0.Enabled = false;
        //    btnHuy0.Enabled = false;

        //    if (radMaDG.Checked)
        //    {
        //        string timkiemMaDG = "select * from tblHSPhieuMuon where MaDG like '%" + txtNDTimKiem.Text + "%'";
        //        ketnoi(timkiemMaDG);
        //        myCommand.ExecuteNonQuery();
        //        dataGridViewDSMuon0.DataSource = ketnoi(timkiemMaDG);
        //        dataGridViewDSMuon0.AutoGenerateColumns = false;
        //        myConnection.Close();
        //    }
        //    else if (radMaSach.Checked)
        //    {
        //        string timkiemMS = "select * from tblHSPhieuMuon where MaSach like '%" + txtNDTimKiem.Text + "%'";
        //        ketnoi(timkiemMS);
        //        myCommand.ExecuteNonQuery();
        //        dataGridViewDSMuon0.DataSource = ketnoi(timkiemMS);
        //        dataGridViewDSMuon0.AutoGenerateColumns = false;
        //        myConnection.Close();
        //    }
        //}


        private void btnLoadDanhSach0_Click(object sender, EventArgs e)
        {
            LoadDataChiTietPhieuMuon();
        }

       
        public int xuly;
        public static DateTime today = DateTime.Now;  //Get Date time now on system
        public static DateTime newday = today.AddDays(5);
        
        //public string ngaymuon, thangmuon, nammuon, ngaytra, thangtra, namtra, ngaydgmuon, ngaydgtra;
        //public int hieumuon,hieutra,catthangmuon,catngaymuon,catngaytra,catthangtra, songaymuon, sothangmuon, sonammuon, songaytra, sothangtra, sonamtra, kq = 1;

        private void dtmNgayMuon0_ValueChanged(object sender, EventArgs e)
        {
            dtNgayTra.Value = dtNgayMuon.Value.AddDays(5);
        }

        private void tabPhieuMuon_Click(object sender, EventArgs e)
        {
            Loadcmb();
            LoadData();
            //setControls(false);
        }

        private void tabQLMuonTraSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            Loadcmb();
            LoadData();
           // setControls(false);
        }

        private void tabQLMuonTraSach_Selected(object sender, TabControlEventArgs e)
        {
            Loadcmb();
            LoadData();
        }

        private void btnThem_Click_1(object sender, EventArgs e)
        {
            setControls(true);
            //txtMaNXB.Text = setMaDG();
            SetValueNull();
            txtMaPhieu.Focus();
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnThem.Enabled = false;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
            xuly = 0;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            xuly = 1;
            suaDG();
            txtMaPhieu.Enabled = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            xoa();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (txtSoLuong.Text == "")
            {
                errTenSach.SetError(txtSoLuong, "Vui lòng nhập Số Lượng");
            }
            else
            {
                errTenSach.Clear();
            }
            if (cmbTinhTrang.Text == "")
            {
                errMaDG0.SetError(cmbTinhTrang, "Vui lòng chọn tính trạng");
            }
            else
            {
                errMaDG0.Clear();
            }
            if (txtSoLuong.Text.Length > 0 && cmbTinhTrang.Text.Length > 0)
            {

                if (xuly == 0)
                {
                    ThemMoi();
                }
                else if (xuly == 1)
                {
                    UpdataDatabase();
                }

                btnLuu.Enabled = false;
                btnHuy.Enabled = false;
                btnThem.Enabled = true;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                setControls(false);
                SetValueNull();
                LoadData();
            }
            else
            {
                MessageBox.Show("Vui lòng nhập đủ thông tin.", "Thông Báo");
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            SetValueNull();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            setControls(false);


            errTenSach.Clear();
            errCD.Clear();
            errTG.Clear();
            errNamXB.Clear();
            errNXB.Clear();
            errTriGia.Clear();
            errSLNhap.Clear();
            errTinhTrang.Clear();
        }

        private void dataGridViewPhieuMuon_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            var phieu = new PhieuMuon();
            foreach (DataGridViewCell cell in dataGridViewPhieuMuon.SelectedCells)
            {
                //cell.RowIndex

                if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colMaPhieuMuon"].Value != null)
                {
                    setControls(false);
                    txtMaPhieu.Text = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colMaPhieuMuon"].Value.ToString();
                    phieu = GetPhieuMuonId(txtMaPhieu.Text);
                    cmbDocGia.SelectedValue = phieu.MaDG;
                    cmbThuThu.SelectedValue = phieu.MaThuThu;
                    cmbTinhTrang.SelectedItem = phieu.TinhTrang;
                }
                if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colSoLuong"].Value != null)
                {
                    txtSoLuong.Text = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colSoLuong"].Value.ToString();
                }
                if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colGhiChuPhieuMuon"].Value != null)
                {
                    txtGhiChu.Text = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colGhiChuPhieuMuon"].Value.ToString();
                }
                //if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colTinhTrang"].Value != null)
                //{
                //    cboTinhTrang.SelectedItem = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colTinhTrang"].Value.ToString();
                //}
            }
        }

        private void groupBox8_Enter(object sender, EventArgs e)
        {

        }

        private void cmbSach_SelectedValueChanged(object sender, EventArgs e)
        {
            string masach = cmbSach.SelectedValue != null ? cmbSach.SelectedValue.ToString():"";
            if (!string.IsNullOrEmpty(masach))
            {
                var sach = GetSachId(masach);
                var tongso =  GetsoLuongTongSoLuongMuon(masach);                
                int tongsocon = sach !=null && sach.SLNhap > 0? sach.SLNhap:0;
                if (tongso != null && tongsocon > 0 && tongso.TongSoNhap > 0 && tongso.TongSoDangMuon > 0)
                {
                    tongsocon = tongso.TongSoNhap - tongso.TongSoDangMuon;
                }
                if (sach != null)
                {
                    txtTenTacGia.Text = sach.TenTacGia;
                    txtTheLoai.Text = sach.TenTheLoai;
                    txtSoLuongCon.Text = tongsocon > 0? tongsocon.ToString() : "0";
                }
            }
          
        }

        //public void soSanhNgay()
        //{
        //    catngaymuon = dtNgayMuon.Text.IndexOf("/");
        //    ngaymuon = dtNgayMuon.Text.Substring(0, catngaymuon);
        //    catthangmuon = dtNgayMuon.Text.LastIndexOf("/");
        //    hieumuon = (catthangmuon - 1) - catngaymuon;
        //    thangmuon = dtNgayMuon.Text.Substring(catngaymuon + 1, hieumuon);
        //    nammuon = dtNgayMuon.Text.Substring(catthangmuon + 1, 4);

        //    songaymuon= Convert.ToInt32(ngaymuon);
        //    sothangmuon= Convert.ToInt32(thangmuon);
        //    sonammuon= Convert.ToInt32(nammuon);

        //    catngaytra = dtNgayTra.Text.IndexOf("/");
        //    ngaytra = dtNgayTra.Text.Substring(0, catngaytra);
        //    catthangtra = dtNgayTra.Text.LastIndexOf("/");
        //    hieutra = (catthangtra - 1) - catngaytra;
        //    thangtra = dtNgayTra.Text.Substring(catngaytra + 1, hieutra);
        //    namtra = dtNgayTra.Text.Substring(catthangtra + 1, 4);

        //    songaytra = Convert.ToInt32(ngaytra);
        //    sothangtra = Convert.ToInt32(thangtra);
        //    sonamtra = Convert.ToInt32(namtra);

        //    DateTime tgMuon = new DateTime(sonammuon, sothangmuon, songaymuon);
        //    DateTime tgTra = new DateTime(sonamtra, sothangtra, songaytra);


        //    //MessageBox.Show("Ngày mượn: " + ngaymuon + "Tháng mượn: " + thangmuon + "Năm mượn: " + nammuon);
        //    kq=tgTra.CompareTo(tgMuon);
        //    //MessageBox.Show("kq: " + kq, "Thông Báo");
        //    //DateTime ngaymuon= new DateTime()
        //}

        public string strluuSLCon;
        private void cboMaSach0_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string strlaydulieu = "select * from tblSach where MaSach='" + cboMaSach0.SelectedValue.ToString() + "'";
            //myConnection = new SqlConnection(strKetNoi);
            //myConnection.Open();
            //string thuchiencaulenh = strlaydulieu;
            //myCommand = new SqlCommand(thuchiencaulenh, myConnection);
            //myDataReaderSach = myCommand.ExecuteReader();
            //while (myDataReaderSach.Read())
            //{
            //    //luuMaSach = cboMaSach0.Text;
            //    txtTTMaSach.Text = myDataReaderSach.GetString(0);
            //    txtTenTacGia.Text = myDataReaderSach.GetString(2);
            //    txtSoLuongCon.Text = myDataReaderSach.GetString(4);
            //    txtTheLoai.Text = myDataReaderSach.GetInt32(7).ToString();
            //    strluuSLCon = txtTheLoai.Text;
            //}
        }

        // Kiểm tra số lượng sách đg đã mượn
        public int luuSLSachDGDaMuon;
        private void slSachDaMuon()
        {
            //string strTinhSLSachDaMuon = "select sum(SLMuon) as Tong from tblHSPhieuMuon where MaDG='" + cboMaDG0.Text + "' group by MaDG";
            //myConnection = new SqlConnection(strKetNoi);
            //myConnection.Open();
            //string thuchiencaulenh = strTinhSLSachDaMuon;
            //myCommand = new SqlCommand(thuchiencaulenh, myConnection);
            //myDataReaderSLSachDaMuon = myCommand.ExecuteReader();
            //while (myDataReaderSLSachDaMuon.Read())
            //{
            //    luuSLSachDGDaMuon = Convert.ToInt32(myDataReaderSLSachDaMuon.GetInt32(0).ToString());
            //}

        }

        public int luuSLCon, luuSLMuon;

        private void cmbMaPhieu_SelectedValueChanged(object sender, EventArgs e)
        {
            string maphieu = cmbMaPhieu.SelectedValue != null ? cmbMaPhieu.SelectedValue.ToString() : "";
            if (!string.IsNullOrEmpty(maphieu))
            {
                var phieu = GetPhieuByMaPhieu(maphieu);
                if (phieu != null)
                {
                    txtTenDocGia.Text = phieu.TenDG;
                    txtThuThu.Text = phieu.TenThuThu;
                    txtTongSoLuongMuon.Text = phieu.SLMuon > 0 ? phieu.SLMuon.ToString() : "";
                }
            }
        }

        private void btnNhap_Click(object sender, EventArgs e)
        {
            setControlsChiTietPM(true);
            xuly = 0;
        }

        private void dataGridViewDSMuon_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            foreach (DataGridViewCell cell in dataGridViewDSMuon.SelectedCells)
            {
                //cell.RowIndex
                setControls(false);
                if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colMaSach"].Value != null)
                {
                    cmbSach.SelectedValue = dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colMaSach"].Value.ToString();                    
                }
                if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colMaPhieu"].Value != null)
                {
                    cmbMaPhieu.SelectedValue = dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colMaPhieu"].Value.ToString();
                }
                if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colNgayMuon"].Value != null && !string.IsNullOrEmpty(dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colNgayMuon"].Value.ToString()))
                {
                    dtNgayMuon.Value = Convert.ToDateTime(dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colNgayMuon"].Value.ToString());
                }
                if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colNgayTra"].Value != null && !string.IsNullOrEmpty(dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colNgayTra"].Value.ToString()))
                {
                    dtNgayTra.Value = Convert.ToDateTime(dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colNgayTra"].Value.ToString());
                }
                if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colTinhTrang"].Value != null)
                {
                    cmbTinhTrangMuonSach.SelectedItem = dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colTinhTrang"].Value.ToString();
                }
                if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colSLMuon"].Value != null)
                {
                    txtSoLuongMuon.Text = dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colSLMuon"].Value.ToString();
                }
                if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colGhiChu"].Value != null)
                {
                    txtGhiChuMuonSach.Text = dataGridViewDSMuon.Rows[cell.RowIndex].Cells["colGhiChu"].Value.ToString();
                }
                //if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["tdTen"].Value != null)
                //{
                //    txtTenTheLoai.Text = dataGridViewDSMuon.Rows[cell.RowIndex].Cells["tdTen"].Value.ToString();
                //}
                //if (dataGridViewDSMuon.Rows[cell.RowIndex].Cells["tdGhiChu"].Value != null)
                //{
                //    txtGhiChu.Text = dataGridViewDSMuon.Rows[cell.RowIndex].Cells["tdGhiChu"].Value.ToString();
                //}
            }
        }

        private void dataGridViewSachMuon_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            var phieu = new ChiTietPhieuMuon();
            foreach (DataGridViewCell cell in dataGridViewSachMuon.SelectedCells)
            {
                //cell.RowIndex

                if (dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraCTPM"].Value != null)
                {
                    //setControlsChiTietPM(false);
                    btnTraSach1.Enabled = true;
                    MaCTPM = dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraCTPM"].Value.ToString();
                    phieu = GetChiTietPM(MaCTPM);
                    txtMaPhieu1.Text = phieu.MaPhieuMuon;
                    txtMaDG1.Text = phieu.MaDG;
                    txtMaSach1.Text = phieu.MaSach;
                    txtSLMuon1.Text = phieu.SoLuong > 0 ? phieu.SoLuong.ToString(): "";
                }
                //if (dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colSLMuon"].Value != null)
                //{
                //    txtSoLuongMuon.Text = dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colSLMuon"].Value.ToString();
                //}
                if (dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraTinhTrang"].Value != null)
                {
                    cmbTinhTrangTraSach.SelectedItem = dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraTinhTrang"].Value.ToString();
                }
              
                if (dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayMuon"].Value != null && !string.IsNullOrEmpty(dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayMuon"].Value.ToString()))
                {
                    dtNgayMuonSach.Value = Convert.ToDateTime(dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayMuon"].Value.ToString());
                }
                if (dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayHenTra"].Value != null && !string.IsNullOrEmpty(dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayHenTra"].Value.ToString()))
                {
                    dtNgayHenTraSach.Value = Convert.ToDateTime(dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayHenTra"].Value.ToString());
                }
                if (dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayDenTra"].Value != null && !string.IsNullOrEmpty(dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayDenTra"].Value.ToString()))
                {
                    dtNgayTraSach.Value = Convert.ToDateTime(dataGridViewSachMuon.Rows[cell.RowIndex].Cells["colTraNgayDenTra"].Value.ToString());
                }
                //if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colNgayTra"].Value != null)
                //{
                //    cboTinhTrang.SelectedItem = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colNgayTra"].Value.ToString();
                //}
            }
        }

        private void txtSeach_TextChanged(object sender, EventArgs e)
        {
            if (radMaPhieu.Checked)
            {
                string timkiem = " where phieumuon.MaPhieu like '%" + txtSeach.Text + "%'";
                LoadData(timkiem);
            }
            else if (radTenDocGia.Checked)
            {
                string timkiem = " where docgia.TenDG like N'%" + txtSeach.Text + "%'";
                LoadData(timkiem);
            }
        }

        private void btnThoat_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        public int luuSLSauChoMuon;
        public int ktmuonchua;
        //public static DateTime today= DateTime.Now;
        //public static DateTime newday = today.AddDays(21);

        //DateTime today = DateTime.Now;  //Get Date time now on system
        //DateTime newday = today.AddDays(21);
        private void muonSach()
        {
            //if (cboMaDG0.Text == "")
            //{
            //    errMaDG0.SetError(cboMaDG0, "Vui lòng chọn Mã ĐG");
            //}
            //else
            //{
            //    errMaDG0.Clear();
            //}

            //if (cboMaSach0.Text == "")
            //{
            //    errMaSach0.SetError(cboMaSach0, "Vui lòng chọn Mã Sách");
            //}
            //else
            //{
            //    errMaSach0.Clear();
            //}

            //if (txtSoLuongMuonSach.Text == "")
            //{
            //    errSLMuon0.SetError(txtSoLuongMuonSach, "Vui lòng chọn SL Mượn");
            //}
            //else
            //{
            //    errSLMuon0.Clear();
            //}

            //bool isNumberSLNhap = int.TryParse(txtSoLuongMuonSach.Text, out luuSLMuon);
            //if (isNumberSLNhap == false)
            //{
            //    MessageBox.Show("Vui lòng nhập số trong ô SL", "Thông Báo");
            //}

            //slSachDaMuon();
            //luuSLCon = Convert.ToInt32(strluuSLCon);
            //luuSLSauChoMuon = luuSLCon - luuSLMuon;
            ////soSanhNgay();
            //if (txtSoLuongMuonSach.Text.Length > 0 && cboMaDG0.Text.Length > 0 && cboMaSach0.Text.Length > 0)
            //{
            //    if (luuSLMuon <= luuSLCon)
            //    {
            //        //MessageBox.Show("SL đã mượn: " + luuSLSachDGDaMuon);
            //        //MessageBox.Show("SL còn: " + luuSLCon);
            //        //MessageBox.Show("Sl mượn: " + txtSLMuon0.Text);

            //        if ((luuSLSachDGDaMuon + luuSLMuon) <= 5 && (luuSLSachDGDaMuon + luuSLMuon) > 0)
            //        {
            //            if (kq == 1)
            //            {
            //                try
            //                {
            //                    ktmuonchua = 0;
            //                    string themdongsqlMuon;
            //                    themdongsqlMuon = "set dateformat dmy; insert into tblHSPhieuMuon values ('" + txtMaPhieu0.Text + "','" + cboMaDG0.Text + "','" + cboMaSach0.Text + "','" + dtNgayMuon.Text + "','" + dtNgayTra.Text + "','" + txtSoLuongMuonSach.Text + "',N'" + cmbTinhTrangMuonSach.Text + "',N'" + txtGhiChuMuonSach.Text + "')";
            //                    ketnoi(themdongsqlMuon);
            //                    MessageBox.Show("Cho mượn thành công.", "Thông Báo");
            //                    //ktmuonchua = 0;
            //                    myCommand.ExecuteNonQuery();
            //                    myConnection.Close();
            //                    ktmuonchua = 0;
            //                }
            //                catch (Exception)
            //                {
            //                    //ktmuonchua = 1;
            //                }

            //                if (ktmuonchua == 0)
            //                {
            //                    try
            //                    {
            //                        string strluuSLSauChoMuon = luuSLSauChoMuon.ToString();
            //                        string strCapNhatSLCon = "update tblSach set SLNhap='" + strluuSLSauChoMuon + " ' where MaSach='" + cboMaSach0.Text + "'";
            //                        ketnoi(strCapNhatSLCon);
            //                        myCommand.ExecuteNonQuery();
            //                        myConnection.Close();
            //                        MessageBox.Show("Đã cập nhật SL Sách vào trong kho.", "Thông Báo");

            //                        string query = "set dateformat dmy; select count(*) from chitietpm where month(NgayThang) = " + dtNgayMuon.Value.Month + " and year(NgayThang) = " + dtNgayMuon.Value.Year + " and MaSach = '" + cboMaSach0.Text + "'";
            //                        ketnoi(query);
            //                        int cnt = (int)myCommand.ExecuteScalar();
            //                        if(cnt == 0)
            //                        {
            //                            query = "select * from ChiTietPM";
            //                            dataGridViewDSMuon.DataSource = ketnoi(query);
            //                            dataGridViewDSMuon.AutoGenerateColumns = false;
            //                            myConnection.Close();

            //                            string maTuDong = "";
            //                            if (myTable.Rows.Count <= 0)
            //                            {
            //                                maTuDong = "PM001";
            //                            }
            //                            else
            //                            {
            //                                int k;
            //                                maTuDong = "PM";
            //                                k = Convert.ToInt32(myTable.Rows[myTable.Rows.Count - 1][0].ToString().Substring(2, 3));
            //                                k = k + 1;
            //                                if (k < 10)
            //                                {
            //                                    maTuDong = maTuDong + "00";
            //                                }
            //                                else if (k < 100)
            //                                {
            //                                    maTuDong = maTuDong + "0";
            //                                }
            //                                maTuDong = maTuDong + k.ToString();
            //                            }

            //                            query = "set dateformat dmy; insert into ChiTietPM values('" + maTuDong + "', '" + cboMaSach0.Text + "', '" + dtNgayMuon.Value.ToString("yyyy-MM-dd") +  "', " + txtSoLuongMuonSach.Text + " )";
            //                            ketnoi(query);
            //                            myCommand.ExecuteNonQuery();
            //                        }
            //                        else
            //                        {
            //                            query = "set dateformat dmy; update ChiTietPM set SoLanMuon += " + txtSoLuongMuonSach.Text + " where month(NgayThang) = " + dtNgayMuon.Value.Month + " and year(NgayThang) = " + dtNgayMuon.Value.Year + " and MaSach = '" + cboMaSach0.Text + "'";
            //                            ketnoi(query);
            //                            //myCommand.ExecuteNonQuery();
            //                        }


            //                        btnNhap.Enabled = true;
            //                        btnChoMuon0.Enabled = false;
            //                        btnHuy0.Enabled = false;
            //                        btnGiaHan.Enabled = true;
            //                        setControlsMuon(false);
            //                        dataGridViewDSMuon.Enabled = true;

            //                    }
            //                    catch (Exception)
            //                    {

            //                    }
            //                }
            //                else
            //                    MessageBox.Show("Mượn thất bại.", "Thông Báo");

            //                string cauTruyVan = "select * from tblHSPhieuMuon";
            //                dataGridViewDSMuon.DataSource = ketnoi(cauTruyVan);
            //                dataGridViewDSMuon.AutoGenerateColumns = false;
            //                myConnection.Close();
            //            }
            //            else
            //                MessageBox.Show("Vui lòng chọn ngày trả lớn hơn ngày mươn.", "Thông Báo");



            //        }
            //        else
            //        {
            //            MessageBox.Show("Không thể mượn.\nSố sách bạn mượn quá 5 cuốn", "Thông Báo");
            //            txtSoLuongMuonSach.Text = "";
            //            txtSoLuongMuonSach.Focus();
            //        }

            //    }
            //    else
            //    {
            //        MessageBox.Show("Không thể mượn nhiều hơn số lượng còn.", "Thông Báo");

            //        txtSoLuongMuonSach.Text = "";
            //        txtSoLuongMuonSach.Focus();
            //    }
            //}
            //else
            //{
            //    MessageBox.Show("Vui lòng nhập đầy đủ thông tin.", "Thông Báo");
            //    txtSoLuongMuonSach.Text = "";
            //    txtSoLuongMuonSach.Focus();
            //}

            if (xuly == 0)
            {
                ThemMoi();
            }
            else if (xuly == 1)
            {
                UpdataDatabase();
            }

            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            setControls(false);
            SetValueNull();
            LoadData();


        }

        //private void giaHanSach()
        //{
        //    //soSanhNgay();
        //    //if (kq == 1)
        //    //{
        //    //    string strCapNhatSLCon = "set dateformat dmy; update tblHSPhieuMuon set NgayMuon='" + dtNgayMuon.Text + " ', NgayTra='" + dtNgayTra.Text + "' where MaPhieu='" + txtMaPhieu0.Text + "'";
        //    //    ketnoi(strCapNhatSLCon);
        //    //    myCommand.ExecuteNonQuery();
        //    //    MessageBox.Show("Gia hạn thành công.", "Thông Báo");

        //    //    string cauTruyVan = "select * from tblHSPhieuMuon";
        //    //    dataGridViewDSMuon.DataSource = ketnoi(cauTruyVan);
        //    //    dataGridViewDSMuon.AutoGenerateColumns = false;
        //    //    myConnection.Close();

        //    //    setControlsMuon(false);
        //    //    btnNhap.Enabled = true;
        //    //    btnChoMuon0.Text = "Cho Mượn";
        //    //    btnChoMuon0.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
        //    //    btnChoMuon0.Enabled = false;
        //    //    btnGiaHan.Enabled = true;
        //    //    btnHuy0.Enabled = false;

        //    //    dataGridViewDSMuon.Enabled = true;
        //    //}
        //    //else
        //    //{
        //    //    MessageBox.Show("Vui lòng chọn ngày trả lớn hơn ngày mượn.", "Thông Báo");
        //    //}
                
        //}
        private void btnChoMuon0_Click(object sender, EventArgs e)
        {            
            if (txtSoLuongCon.Text != "0")
            {

                if (xuly == 0)
                {
                    ThemMoiChiTietPhieuMuon();
                }
                else if (xuly == 1)
                {
                    //UpdataDatabase();
                }
                else if (xuly == 3)
                {
                    UpdataGiaHan();
                }

                btnLuu.Enabled = false;
                btnHuy.Enabled = false;
                btnThem.Enabled = true;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                btnChoMuon0.Enabled = false;
                setControls(false);
                SetValueNullChiTietPM();
                LoadDataChiTietPhieuMuon();
                Loadcmb();
                btnChoMuon0.Enabled = false;
            }
            else
            {
                MessageBox.Show("Sách mượn đã hết.", "Thông Báo");
            }

        }

        private void btnGiaHan_Click(object sender, EventArgs e)
        {
            dtNgayTra.Enabled = true;
            xuly = 3;
        }

        private void btnHuy0_Click(object sender, EventArgs e)
        {
            setControlsChiTietPM(true);
            SetValueNullChiTietPM();
            btnNhap.Enabled = true;
            btnChoMuon0.Enabled = false;
            //txtMaPhieu0.Text = tangMaTuDong();
            //cboMaDG0.Text = "";
            //cboMaSach0.Text = "";
            //txtSoLuongMuonSach.Text = "";
            //dtNgayMuon.Value = DateTime.Now;
            //dtNgayTra.Value = DateTime.Now.AddDays(5);
            //txtGhiChuMuonSach.Text = "";

            //btnChoMuon0.Text = "Cho Mượn";
            //btnChoMuon0.TextAlign = System.Drawing.ContentAlignment.MiddleRight;

            //btnNhap.Enabled = true;
            //btnChoMuon0.Enabled = false;
            //btnGiaHan.Enabled = true;
            //btnHuy0.Enabled = false;
            //setControlsMuon(false);
            //dataGridViewDSMuon.Enabled = true;

            //lblNhapSLNhap.Text = "";
        }

        private void btnThoat0_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        private void setControlsTra(bool edit)
        {
            txtMaPhieu1.Enabled = edit;
            txtMaDG1.Enabled = edit;
            txtMaSach1.Enabled = edit;
            txtSLMuon1.Enabled = edit;
            dtNgayMuonSach.Enabled = edit;
            dtNgayHenTraSach.Enabled = edit;
        }

      //  public string maPhieu1, maDG1, maSach1, luuSLTra1, ngayMuon1, ngayTra1, ghiChu1, tinhTrang1;
        private void dataGridViewDSMuon1_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            //try
            //{
            //    int row = e.RowIndex;
            //    txtMaPhieu1.Text=myTable.Rows[row]["MaPhieu"].ToString();
            //    maPhieu1 = txtMaPhieu1.Text;
            //    txtMaDG1.Text = myTable.Rows[row]["MaDG"].ToString();
            //    maDG1 = txtMaDG1.Text;
            //    txtMaSach1.Text = myTable.Rows[row]["MaSach"].ToString();
            //    maSach1 = txtMaSach1.Text;
            //    txtSLMuon1.Text = myTable.Rows[row]["SLMuon"].ToString();
            //    luuSLTra1 = txtSLMuon1.Text;
            //    dtNgayMuonSach.Text = myTable.Rows[row]["NgayMuon"].ToString();
            //    ngayMuon1 = dtNgayMuonSach.Text;
            //    dtNgayHenTraSach.Text = myTable.Rows[row]["NgayTra"].ToString();
            //    ngayTra1 = dtNgayHenTraSach.Text;
            //    //txtTinhTrang1.Text = myTable.Rows[row]["TinhTrang"].ToString();
            //    //tinhTrang1 = txtTinhTrang1.Text;
            //    //txtGhiChu1.Text = myTable.Rows[row]["GhiChu"].ToString();
            //    //ghiChu1 = txtGhiChu1.Text;
            //}
            //catch(Exception)
            //{

            //}
        }

        public int luuSLSauTra;
        public string luuSLConTabMuon;

        private void traSach()
        {
            DialogResult dlr;
            dlr = MessageBox.Show("Bạn chắc chắn muốn trả sách.", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dlr == DialogResult.Yes)
            {
                string qry = "Update ChiTietPM set " +
               " [NgayDenTra] = '" + dtNgayTraSach.Value.ToString("yyyy-MM-dd") + "'"+
               ", [TinhTrang] = N'" + cmbTinhTrangTraSach.SelectedItem + "'" +
               " where MaCTPT = '" + MaCTPM + "'";
                var status = common.thucthidulieu(qry);
                if (status)
                {
                    MessageBox.Show("Trả sách thành công.");
                }
                else
                {
                    MessageBox.Show("Trả sách không thành công.");
                }
                LoadDataChiTietSachMuon();
            }
          
        }
        private void btnTraSach1_Click(object sender, EventArgs e)
        {
            traSach();
        }
 
        private void btnThoat1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtNDTimKiem1_TextChanged(object sender, EventArgs e)
        {
            if (radMaDG1.Checked)
            {
                string timkiemDG1 = "and phieumuon.MaDG like '%" + txtNDTimKiem1.Text + "%'";
                LoadDataChiTietSachMuon(timkiemDG1);
            }
            else if (radMaSach1.Checked)
            {
                string timkiemMS2 = "and ctpm.MaSach like '%" + txtNDTimKiem1.Text + "%'";
                LoadDataChiTietSachMuon(timkiemMS2);
            }
        }

        private void btnLoadDS1_Click(object sender, EventArgs e)
        {
           
            LoadDataChiTietSachMuon();
        }

        private void tabPage2_Click(object sender, EventArgs e)
        {
           
        }

        private void cboTinhTrang0_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}
