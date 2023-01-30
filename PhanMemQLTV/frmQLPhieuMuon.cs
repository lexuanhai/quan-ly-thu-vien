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
using System.Globalization;
using PhanMemQLTV.Model;
using System.Reflection;
using System.Collections;

namespace PhanMemQLTV
{
    public partial class frmQLPhieuMuon : Form
    {
        public frmQLPhieuMuon()
        {
            InitializeComponent();
        }
        public int xuly;
        Common common = new Common();        

        // load combox
        public void Loadcmb()
        {
            CmbDocGia();
            CmbThuThu();
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
       
        public Sach GetSachId(string masach)
        {
            DataTable dt;
            string query = "select * from tblSach where MaSach='"+ masach + "'";
            dt = common.docdulieu(query);
            var model = new Sach();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int n = dataGridViewPhieuMuon.Rows.Add();
                    model.MaSach = dr["MaSach"].ToString();
                    model.MaNXB = dr["MaNXB"].ToString();
                    model.MaTheLoai = dr["MaTheLoai"].ToString();
                    model.MaTacGia = dr["MaTacGia"].ToString();
                }
            }
            return model;
        }
        public void LoadData(string qry ="")
        {
            DataTable dt;
            string query = "select *, sach.TinhTrang as TinhTrangSach,sach.Ghichu as GhiChiSach from tblSach sach " +
                "inner join tblTheLoai theloai on theloai.MaTheLoai = sach.MaTheLoai " +
                "inner join tblNhaXuatBan nxb on nxb.MaNXB = sach.MaNXB " +
                "inner join tblTacGia tacgia on tacgia.MaTacGia = sach.MaTacGia";
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
                    dataGridViewPhieuMuon.Rows[n].Cells[0].Value = dr["MaSach"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[1].Value = dr["TenSach"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[2].Value = dr["TenTheLoai"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[3].Value = dr["TenTG"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[4].Value = dr["TenNXB"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[5].Value = dr["NamXB"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[6].Value = dr["NgNhapSach"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[7].Value = dr["SLNhap"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[8].Value = dr["TriGia"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[9].Value = dr["TinhTrang"].ToString();
                    dataGridViewPhieuMuon.Rows[n].Cells[10].Value = dr["GhiChiSach"].ToString();
                }
            }
        }

        public PhieuMuon GetValue()
        {
            var model = new PhieuMuon();
            model.MaPhieu = txtMaPhieu.Text;
            model.SLMuon = !string.IsNullOrEmpty(txtSoLuong.Text) ? Convert.ToInt32(txtSoLuong.Text) : 0;
            model.TinhTrang = cmbTinhTrang.SelectedItem != null ? cmbTinhTrang.SelectedItem.ToString() : "";
            model.Ghichu = txtSoLuong.Text;
            //  cmb
            model.MaDG = cmbDocGia.SelectedValue != null ? cmbDocGia.SelectedValue .ToString():"";
            model.MaThuThu = cmbThuThu.SelectedValue != null ? cmbThuThu.SelectedValue.ToString() : "";

            return model;
        }
        public void SetValue(PhieuMuon model)
        {
            txtMaPhieu.Text = model.MaPhieu;
            txtSoLuong.Text = model.SLMuon > 0 ? Convert.ToString(model.SLMuon):"";
            txtGhiChu.Text = model.Ghichu;
            // cmb
            cmbDocGia.SelectedValue = model.MaDG;
            cmbThuThu.SelectedValue = model.MaThuThu;
            cmbTinhTrang.SelectedItem = model.TinhTrang;
        }

        private void setControls(bool edit)
        {
            txtMaPhieu.Enabled = edit;
            txtSoLuong.Enabled = edit;
            txtGhiChu.Enabled = edit;
            cmbDocGia.Enabled = edit;
            cmbThuThu.Enabled = edit;
            cmbTinhTrang.Enabled = edit;
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


        private void frmQLSach_Load(object sender, EventArgs e)
        {
            Loadcmb();
            LoadData();
            setControls(false);
            //string cauTruyVan = "select * from tblSach";
            ////dataGridViewDSSach.DataSource = ketnoi(cauTruyVan);
            //dataGridViewDSSach.AutoGenerateColumns = false;
            ////myConnection.Close();
            //setControls(false);
            //dataGridViewDSSach.Enabled = true;
            //btnLuu.Enabled = false;
            //btnHuy.Enabled = false;
            //txtMaSach.Enabled = false;   
        }

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

        
        private void btnThem_Click(object sender, EventArgs e)
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

            //dtmNgNhapSach.Text = "";
            //txtMaSach.Text = tangMaTuDong();
            //txtTenSach.Text = "";
            ////txtTheLoai.Text = "";
            ////txtTacGia.Text = "";
            ////txtNXB.Text = "";
            //txtSLNhap.Text = "";
            //txtNamXB.Text = "";
            //txtTriGia.Text = "";
            //cboTinhTrang.Text = "";
            //txtGhiChu.Text = "";

            //setControls(true);
            //dataGridViewDSSach.Enabled = false;
            //txtTenSach.Focus();
            //btnSua.Enabled = false;
            //btnXoa.Enabled = false;
            //btnThem.Enabled = false;
            //btnLuu.Enabled = true;
            //btnHuy.Enabled = true;
            //xuly = 0;
        }
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

        private void btnSua_Click(object sender, EventArgs e)
        {
            xuly = 1;
            suaDG();
            txtMaPhieu.Enabled = false;
            //cboTinhTrang.Text = "Mới";
            //setControls(true);
            //btnSua.Enabled = false;
            //btnLuu.Enabled = true;
            //btnHuy.Enabled = true;
            //btnXoa.Enabled = false;
            //btnThem.Enabled = false;
            ////dataGridViewDSSach.Enabled = false;
            //txtTenSach.Focus();
            //xuly = 1;
            //lblNhapCD.Text = "";
            //lblNhapTriGia.Text = "";
            //lblNhapSLCon.Text = "";
            //lblNhapSLNhap.Text = "";
            //lblNhapTenNXB.Text = "";
            //lblNhapTenSach.Text = "";
            //lblNhapTenTG.Text = "";
            //lblNhapTinhTrang.Text = "";
        }

        private void xoaSach()
        {

            if (!string.IsNullOrEmpty(txtMaPhieu.Text))
            {
                DialogResult dlr;
                dlr = MessageBox.Show("Bạn chắc chắn muốn xóa.", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.Yes)
                {
                    try
                    {
                        string qry = "DELETE FROM tblSach WHERE MaSach='" + txtMaPhieu.Text + "'";
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
        private void btnXoa_Click(object sender, EventArgs e)
        {
            xoaSach();
        }

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
        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (txtMaPhieu.Text=="")
            {
                errTenSach.SetError(txtMaPhieu, "Vui lòng nhập Mã Phiếu");
            }
            else
            {
                errTenSach.Clear();
            }
            //if (txtTheLoai.Text == "")
            //{
            //    errCD.SetError(txtTheLoai, "Vui lòng nhập Chủ Đề");
            //}
            //else
            //{
            //    errCD.Clear();
            //}
            //if (txtTacGia.Text == "")
            //{
            //    errTG.SetError(txtTacGia, "Vui lòng nhập Tác Giả");
            //}
            //else
            //{
            //    errTG.Clear();
            //}
            //if (txtNXB.Text == "")
            //{
            //    errNXB.SetError(txtNXB, "Vui lòng nhập NXB");
            //}
            //else
            //{
            //    errNXB.Clear();
            //}
            //if (txtNamXB.Text == "")
            //{
            //    errNamXB.SetError(txtNamXB, "Vui lòng nhập Năm XB");
            //}
            //else
            //{
            //    errNXB.Clear();
            //}
            //if (txtSLNhap.Text == "")
            //{
            //    errSLNhap.SetError(txtSLNhap, "Vui lòng nhập SL");
            //}
            //else
            //{
            //    errSLNhap.Clear();
            //}

            //if (txtTriGia.Text == "")
            //{
            //    errTriGia.SetError(txtTriGia, "Vui lòng nhập Đơn Giá");
            //}
            //else
            //{
            //    errTriGia.Clear();
            //}
            //if (cboTinhTrang.Text == "")
            //{
            //    errTinhTrang.SetError(cboTinhTrang, "Vui lòng nhập Tình Trạng");
            //}
            //else
            //{
            //    errTinhTrang.Clear();
            //}

            // string query = "select GiaTri from thamso where TenTS = 'ThoiGianXB'";
            //// ketnoi(query);
            // int tgXB = Convert.ToInt32(myCommand.ExecuteScalar());

            // if(DateTime.Now.Year - Convert.ToInt32(txtNamXB.Text) > tgXB)
            // {
            //     MessageBox.Show("Năm xuất bản không hợp lệ!");
            //     return;
            // }


            // int ktSLNhap, ktNamXB, ktTriGia;
            // bool isNumberSLNhap = int.TryParse(txtSLNhap.Text, out ktSLNhap);
            // bool isNumberTriGia = int.TryParse(txtTriGia.Text, out ktTriGia);
            // bool isNumberNamXB = int.TryParse(txtNamXB.Text, out ktNamXB);
            // if(isNumberSLNhap==false || isNumberTriGia==false || isNumberNamXB==false)
            // {
            //     MessageBox.Show("Vui lòng nhập số trong các ô:\nSL Nhập.\nNăm XB.\nĐơn Giá.", "Thông Báo");
            // }
            //if (dtmNgNhapSach.Text.Length>0 && txtTenSach.Text.Length > 0 && txtTacGia.Text.Length > 0 && txtNXB.Text.Length > 0 && txtTheLoai.Text.Length > 0 && isNumberSLNhap == true && isNumberTriGia == true && cboTinhTrang.Text.Length > 0 && isNumberNamXB == true)
            //{
            //        if (xuly == 0)
            //        {
            //            themSach();
            //        }
            //        else if (xuly == 1)
            //        {
            //            suaSach();

            //        }
            //        string cauTruyVan = "select * from tblSach";
            //       // dataGridViewDSSach.DataSource = ketnoi(cauTruyVan);
            //        dataGridViewDSSach.AutoGenerateColumns = false;
            //      //  myConnection.Close();
            //        btnLuu.Enabled = false;
            //        btnHuy.Enabled = false;
            //        btnThem.Enabled = true;
            //        btnSua.Enabled = true;
            //        btnXoa.Enabled = true;
            //        setControls(false);
            //        dataGridViewDSSach.Enabled = true;

            //        errTenSach.Clear();
            //        errCD.Clear();
            //        errTG.Clear();
            //        errNamXB.Clear();
            //        errNXB.Clear();
            //        errTriGia.Clear();
            //        errSLNhap.Clear();
            //        errTinhTrang.Clear();

            //}
            //else
            //{
            //    MessageBox.Show("Vui lòng nhập đủ thông tin.", "Thông Báo");
            //    if (txtTenSach.Text.Length == 0)
            //        txtTenSach.Focus();
            //    //else if (txtTheLoai.Text.Length == 0)
            //    //    txtTheLoai.Focus();
            //    //else if (txtTacGia.Text.Length == 0)
            //    //    txtTacGia.Focus();
            //    //else if (txtNXB.Text.Length == 0)
            //    //    txtNXB.Focus();
            //    else if (txtNamXB.Text.Length == 0)
            //        txtNamXB.Focus();
            //    else if (txtSLNhap.Text.Length == 0)
            //        txtSLNhap.Focus();
            //    else if (txtTriGia.Text.Length == 0)
            //        txtTriGia.Focus();
            //    else if (cboTinhTrang.Text.Length == 0)
            //        cboTinhTrang.Focus();
            //}
            //

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
        private void ThemMoi()
        {
            try
            {
                var model = GetValue();
                if (model != null && !string.IsNullOrEmpty(model.MaPhieu))
                {
                    if (!Exist(model.MaPhieu))
                    {
                        var qry = "Insert into tblHSPhieuMuon([MaPhieu] " +
                            ",[MaThuThu] " +
                            ",[MaDG] " +
                            ",[SLMuon] " +
                            ",[TinhTrang] " +
                            ",[GhiChu] )values('" + model.MaPhieu + "'," +
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
                    else
                    {
                        MessageBox.Show("Mã nhà xuất bản đã tồn tại.");
                    }
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
            txtMaPhieu.ReadOnly = true;
            string qry = "Update tblHSPhieuMuon set [MaThuThu] ='" + model.MaThuThu+"' , " +
                "[MaDG] = '" + model.MaDG+"', " +
                "[SLMuon]=" + model.SLMuon +" , " +
                " [TinhTrang]= N'"+model.TinhTrang+"'," +
                " [Ghichu]= N'"+model.Ghichu+"'" +
                " where MaPhieu = '" + model.MaPhieu+"'";
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

        private void btnHuy_Click(object sender, EventArgs e)
        {
            //setControls(false);
            //dataGridViewDSSach.Enabled = true;
            //btnLuu.Enabled = false;
            //btnHuy.Enabled = false;
            //btnThem.Enabled = true;
            //btnSua.Enabled = true;
            //btnXoa.Enabled = true;
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
            if (radMaSach.Checked)
            {
                string timkiemMS = " where sach.MaSach ='"+ txtNDTimKiem.Text + "'";
                LoadData(timkiemMS);
            }
            else if (radTenSach.Checked)
            {
                //string timkiemTS = "select * from tblSach where TenSach like N'%" + txtNDTimKiem.Text + "%'";

                string timkiemMS = " where sach.TenSach like N'%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiemMS);
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

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void dataGridViewPhieuMuon_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //var sach = new Sach();
            //foreach (DataGridViewCell cell in dataGridViewPhieuMuon.SelectedCells)
            //{
            //    //cell.RowIndex

            //    if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colMaSach"].Value != null)
            //    {
            //        setControls(false);
            //        txtMaSach.Text = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colMaSach"].Value.ToString();
            //        sach = GetSachId(txtMaSach.Text);
            //        cmbTheLoai.SelectedValue = sach.MaTheLoai;
            //        cmbNXB.SelectedValue = sach.MaNXB;
            //        cmbTacGia.SelectedValue = sach.MaTacGia;
            //    }
            //    if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colTenSach"].Value != null)
            //    {
            //        txtTenSach.Text = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colTenSach"].Value.ToString();
            //    }

            //    if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colNamXB"].Value != null)
            //    {
            //        txtNamXB.Text = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colNamXB"].Value.ToString();
            //    }
            //    if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colNgayNhapSach"].Value != null)
            //    {
            //        dtmNgNhapSach.Value = Convert.ToDateTime(dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colNgayNhapSach"].Value.ToString());
            //    }
            //    if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colSoLuong"].Value != null)
            //    {
            //        txtSLNhap.Text = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colSoLuong"].Value.ToString();
            //    }
            //    if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colTriGia"].Value != null)
            //    {
            //        txtTriGia.Text = dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colTriGia"].Value.ToString();
            //    }
            //    if (dataGridViewPhieuMuon.Rows[cell.RowIndex].Cells["colGhiChu"].Value != null)
            //    {
            //        txtGhiChu.Text = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colGhiChu"].Value.ToString();
            //    }
            //    if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colTinhTrang"].Value != null)
            //    {
            //        cboTinhTrang.SelectedItem = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colTinhTrang"].Value.ToString();
            //    }
            //}
        }
    }
}
