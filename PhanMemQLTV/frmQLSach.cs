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
    public partial class frmQLSach : Form
    {
        public frmQLSach()
        {
            InitializeComponent();
        }
        public int xuly;
        Common common = new Common();
        //string chuoiKetNoi = ConfigurationManager.ConnectionStrings["strConn"].ConnectionString;
        //private SqlConnection myConnection;
        //private SqlDataAdapter myDataAdapter;
        //private DataTable myTable;
        //private SqlCommand myCommand;

        //public int xuly;
        //Common common = new Common();
        //public void LoadData(string query = "")
        //{
        //    DataTable dt;
        //    if (!string.IsNullOrEmpty(query))
        //    {
        //        dt = common.docdulieu(query);
        //    }
        //    else
        //    {
        //        dt = common.docdulieu("select * from tblTheLoai Where IsDeteled != 1");
        //    }
        //    dataGridViewDSSach.Rows.Clear();
        //    if (dt != null && dt.Rows.Count > 0)
        //    {
        //        dataGVTheLoai.Rows.Clear();
        //        foreach (DataRow dr in dt.Rows)
        //        {
        //            int n = dataGVTheLoai.Rows.Add();
        //            dataGVTheLoai.Rows[n].Cells[0].Value = dr["MaTheLoai"].ToString();
        //            dataGVTheLoai.Rows[n].Cells[1].Value = dr["TenTheLoai"].ToString();
        //            dataGVTheLoai.Rows[n].Cells[2].Value = dr["GhiChu"].ToString();
        //            //dataGVTheLoai.Rows[n].Cells[3].Value = dr["Email"].ToString();
        //            //dataGVTheLoai.Rows[n].Cells[4].Value = dr["Website"].ToString();
        //            //dataGVTheLoai.Rows[n].Cells[5].Value = dr["DiaChi"].ToString();
        //        }
        //    }
        //}

        //// Phương thức thiết lập Controls
        //private void setControls(bool edit)
        //{
        //    txtMaTheLoai.Enabled = edit;
        //    txtTenTheLoai.Enabled = edit;
        //    txtGhiChu.Enabled = edit;
        //}

        //public TheLoai GetValue()
        //{
        //    var model = new TheLoai();
        //    model.MaTheLoai = txtMaTheLoai.Text;
        //    model.TenTheLoai = txtTenTheLoai.Text;
        //    model.GhiChu = txtGhiChu.Text;
        //    return model;
        //}
        //public void SetValue(TheLoai model)
        //{
        //    txtMaTheLoai.Text = model.MaTheLoai;
        //    txtTenTheLoai.Text = model.TenTheLoai;
        //    txtGhiChu.Text = model.GhiChu;
        //}

        // load combox
        public void Loadcmb()
        {
            CmbTacGia();
            CmbNXB();
            CmbTheLoai();
            CmbViTri();
        }
        
        public void CmbTacGia()
        {

            DataTable dt;
            string query = "select * from tblTacGia";
            dt = common.docdulieu(query);
            cmbTacGia.DisplayMember = "TenTG";
            cmbTacGia.ValueMember = "MaTacGia";
            cmbTacGia.DataSource = dt;
        }
        public void CmbViTri()
        {

            DataTable dt;
            string query = "select * from tblViTri";
            dt = common.docdulieu(query);
            if (dt != null && dt.Rows != null && dt.Rows.Count > 0)
            {
                //var lstViTri = new List<ViTri>();
                //foreach (DataRow item in dt.Rows)
                //{
                //    var viTri = new ViTri();
                //    viTri.MaViTri = item["MaViTri"].ToString();
                //    viTri.Khu = item["Khu"].ToString();
                //    viTri.Ke = item["Ke"].ToString();
                //    viTri.Ngan = item["Ngan"].ToString();
                //    viTri.Name = viTri.Khu + " - " + viTri.Ke + " - "+ viTri.Ngan;
                //    lstViTri.Add(viTri);
                //}
                //cmbViTri.DisplayMember = "Name";
                //cmbViTri.ValueMember = "MaViTri";
                //cmbViTri.DataSource = lstViTri;
            }
           
        }
        public void CmbNXB()
        {

            DataTable dt;
            string query = "select * from tblNhaXuatBan";
            dt = common.docdulieu(query);
            cmbNXB.DisplayMember = "TenNXB";
            cmbNXB.ValueMember = "MaNXB";
            cmbNXB.DataSource = dt;
        }
        public void CmbTheLoai()
        {
            DataTable dt;
            string query = "select * from tblTheLoai";
            dt = common.docdulieu(query);
            cmbTheLoai.DisplayMember = "TenTheLoai";
            cmbTheLoai.ValueMember = "MaTheLoai";
            cmbTheLoai.DataSource = dt;
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
                    int n = dataGridViewDSSach.Rows.Add();
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

            dataGridViewDSSach.Rows.Clear();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int n = dataGridViewDSSach.Rows.Add();
                    dataGridViewDSSach.Rows[n].Cells[0].Value = dr["MaSach"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[1].Value = dr["TenSach"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[2].Value = dr["TenTheLoai"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[3].Value = dr["TenTG"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[4].Value = dr["TenNXB"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[5].Value = dr["NamXB"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[6].Value = dr["NgNhapSach"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[7].Value = dr["SLNhap"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[8].Value = dr["TriGia"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[9].Value = dr["TinhTrang"].ToString();
                    dataGridViewDSSach.Rows[n].Cells[10].Value = dr["GhiChiSach"].ToString();
                }
            }
        }

        public Sach GetValue()
        {
            var model = new Sach();
            model.TenSach = txtTenSach.Text;
            model.MaSach = txtMaSach.Text;
            model.NamXB = !string.IsNullOrEmpty(txtNamXB.Text) ? Convert.ToInt32(txtNamXB.Text):0;
            model.SLNhap = !string.IsNullOrEmpty(txtSLNhap.Text) ? Convert.ToInt32(txtSLNhap.Text) : 0;
            model.TriGia = !string.IsNullOrEmpty(txtTriGia.Text) ? Convert.ToInt32(txtTriGia.Text) : 0;
            model.Ghichu = txtGhiChu.Text;
            model.NgNhapSach = dtmNgNhapSach.Value;
            model.TinhTrang = cboTinhTrang.SelectedItem != null ? cboTinhTrang.SelectedItem.ToString() :"";
            //  cmb
            model.MaTacGia = cmbTacGia.SelectedValue != null ? cmbTacGia.SelectedValue .ToString():"";
            model.MaTheLoai = cmbTheLoai.SelectedValue != null ? cmbTheLoai.SelectedValue.ToString() : "";
            model.MaNXB = cmbNXB.SelectedValue != null ? cmbNXB.SelectedValue.ToString() : "";

            return model;
        }
        public void SetValue(Sach model)
        {
            txtTenSach.Text = model.TenSach;
            txtMaSach.Text = model.MaSach;
            txtNamXB.Text = model.NamXB > 0 ? model.NamXB.ToString() : "";
            txtSLNhap.Text = model.SLNhap > 0 ? model.SLNhap.ToString() : "";
            txtTriGia.Text = model.TriGia > 0 ? model.TriGia.ToString() : "";
            txtGhiChu.Text = model.Ghichu;
            cboTinhTrang.SelectedItem = model.TinhTrang;

            // cmb
            cmbTacGia.SelectedValue = model.MaTacGia;
            cmbTheLoai.SelectedValue = model.MaTheLoai;
            cmbNXB.SelectedValue = model.MaNXB;
        }

        private void setControls(bool edit)
        {
            dtmNgNhapSach.Enabled = edit;
            txtTenSach.Enabled = edit;
            //txtTheLoai.Enabled = edit;
            //txtTacGia.Enabled = edit;
            //txtNXB.Enabled = edit;
            //txtMaSach.Enabled = edit;
            txtNamXB.Enabled = edit;
            txtSLNhap.Enabled = edit;
            txtTriGia.Enabled = edit;
            cboTinhTrang.Enabled = edit;
            cmbTacGia.Enabled = edit;
            cmbTheLoai.Enabled = edit;
            cmbNXB.Enabled = edit;
            cmbViTri.Enabled = edit;
            txtTenSach.Enabled = edit;

            txtGhiChu.Enabled = edit;
        }
        public void SetValueNull()
        {
            txtTenSach.Text = "";
            txtMaSach.Text = "";
            txtNamXB.Text = "";
            txtSLNhap.Text = "";
            txtTriGia.Text = "";
            txtGhiChu.Text = "";
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
            txtMaSach.Focus();
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
            txtMaSach.Enabled = false;
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

            if (!string.IsNullOrEmpty(txtMaSach.Text))
            {
                DialogResult dlr;
                dlr = MessageBox.Show("Bạn chắc chắn muốn xóa.", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.Yes)
                {
                    try
                    {
                        string qry = "DELETE FROM tblSach WHERE MaSach='" + txtMaSach.Text + "'";
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
            //txtMaSach.Text  =  dataGridViewDSSach.CurrentRow.Cells[0].Value.ToString();
            //dtmNgNhapSach.Text = dataGridViewDSSach.CurrentRow.Cells[1].Value.ToString();
            //txtTenSach.Text = dataGridViewDSSach.CurrentRow.Cells[2].Value.ToString();
            ////txtTheLoai.Text = dataGridViewDSSach.CurrentRow.Cells[3].Value.ToString();
            ////txtTacGia.Text = dataGridViewDSSach.CurrentRow.Cells[4].Value.ToString();
            ////txtNXB.Text = dataGridViewDSSach.CurrentRow.Cells[5].Value.ToString();
            //txtNamXB.Text = dataGridViewDSSach.CurrentRow.Cells[6].Value.ToString();
            //txtSLNhap.Text = dataGridViewDSSach.CurrentRow.Cells[8].Value.ToString();
            //txtTriGia.Text = dataGridViewDSSach.CurrentRow.Cells[7].Value.ToString();
            //cboTinhTrang.Text = dataGridViewDSSach.CurrentRow.Cells[9].Value.ToString();
            //txtGhiChu.Text = dataGridViewDSSach.CurrentRow.Cells[10].Value.ToString();
            var sach = new Sach(); 
            foreach (DataGridViewCell cell in dataGridViewDSSach.SelectedCells)
            {
                //cell.RowIndex

                if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colMaSach"].Value != null)
                {
                    setControls(false);
                    txtMaSach.Text = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colMaSach"].Value.ToString();
                    sach = GetSachId(txtMaSach.Text);
                    cmbTheLoai.SelectedValue = sach.MaTheLoai;
                    cmbNXB.SelectedValue = sach.MaNXB;
                    cmbTacGia.SelectedValue = sach.MaTacGia;
                }
                if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colTenSach"].Value != null)
                {
                    txtTenSach.Text = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colTenSach"].Value.ToString();
                }                

                if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colNamXB"].Value != null)
                {
                    txtNamXB.Text = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colNamXB"].Value.ToString();
                }
                if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colNgayNhapSach"].Value != null)
                {
                    dtmNgNhapSach.Value = Convert.ToDateTime(dataGridViewDSSach.Rows[cell.RowIndex].Cells["colNgayNhapSach"].Value.ToString());
                }
                if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colSoLuong"].Value != null)
                {
                    txtSLNhap.Text = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colSoLuong"].Value.ToString();
                }
                if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colTriGia"].Value != null)
                {
                    txtTriGia.Text = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colTriGia"].Value.ToString();
                }
                if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colGhiChu"].Value != null)
                {
                    txtGhiChu.Text = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colGhiChu"].Value.ToString();
                }
                if (dataGridViewDSSach.Rows[cell.RowIndex].Cells["colTinhTrang"].Value != null)
                {
                    cboTinhTrang.SelectedItem = dataGridViewDSSach.Rows[cell.RowIndex].Cells["colTinhTrang"].Value.ToString();
                }
            }

        }

        private void txtMaSach_TextChanged(object sender, EventArgs e)
        {

        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (txtTenSach.Text=="")
            {
                errTenSach.SetError(txtTenSach, "Vui lòng nhập Tên Sách");
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
                string ma = common.tangMaTuDong("tblSach", "Sach");
                var qry = "Insert into tblSach([MaSach] ," +
                             "[NgNhapSach] ," +
                             "[TenSach] ," +
                             "[MaTheLoai] ," +
                             "[MaTacGia] ," +
                             "[MaNXB] ," +
                             "[NamXB] ," +
                             "[SLNhap] ," +
                             "[TriGia] ," +
                             "[TinhTrang] ,[Ghichu] )values('" + ma + "'," +
                             "'" + model.NgNhapSach + "'," +
                             "N'" + model.TenSach + "'," +
                             "'" + model.MaTheLoai + "'," +
                             "'" + model.MaTacGia + "'," +
                             "'" + model.MaNXB + "'," +
                             "" + model.NamXB + "," +
                             "" + model.SLNhap + "," +
                             "" + model.TriGia + "," +
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
            txtMaSach.ReadOnly = true;
            string qry = "Update tblSach set [NgNhapSach] ='"+model.NgNhapSach+"' , " +
                "[TenSach] = N'"+model.TenSach+"', " +
                "[MaTheLoai]='"+model.MaTheLoai+"' , " +
                "[MaTacGia]='"+model.MaTacGia+"' , " +
                "[MaNXB]='"+model.MaNXB+"' , " +
                "[NamXB]= "+model.NamXB+", " +
                "[SLNhap]= "+model.SLNhap+"," +
                " [TriGia]="+model.TriGia+" ," +
                " [TinhTrang]= N'"+model.TinhTrang+"'," +
                " [Ghichu]= N'"+model.Ghichu+"'" +
                " where MaSach = '"+model.MaSach+"'";
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
            dataGridViewDSSach.AutoGenerateColumns = false;
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
            else if (radTenTG.Checked)
            {
                string timkiemMS = " where tacgia.TenTG like N'%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiemMS);
               
            }
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


    }
}
