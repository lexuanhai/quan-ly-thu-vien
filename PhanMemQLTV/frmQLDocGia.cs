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
using QuanLyThuVien.Model;
using System.Collections;
using System.Reflection;

namespace QuanLyThuVien
{
    public partial class frmQLDocGia : Form
    {
        public frmQLDocGia()
        {
            InitializeComponent();
        }
        Common common = new Common();
        private void setControls(bool edit)
        {
            txtTenDG.Enabled = edit;
            dtmNgaySinh.Enabled = edit;
            cboGioiTinh.Enabled = edit;
            txtDiaChi.Enabled = edit;
            txtEmail.Enabled = edit;
            txtTenTK.Enabled = edit;
            txtMK.Enabled = edit;
            txtGhiChu.Enabled = edit;
        }

        public void LoadData(string query = "")
        {
            DataTable dt;
            if (!string.IsNullOrEmpty(query))
            {
                dt = common.docdulieu(query);
            }
            else
            {
                dt = common.docdulieu("select * from tblDocGia order by MaDG desc");
            }
            dataGridViewDSDocGia.Rows.Clear();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int n = dataGridViewDSDocGia.Rows.Add();
                    dataGridViewDSDocGia.Rows[n].Cells[0].Value = dr["MaDG"].ToString();
                    dataGridViewDSDocGia.Rows[n].Cells[1].Value = dr["TenDG"].ToString();
                    dataGridViewDSDocGia.Rows[n].Cells[2].Value = dr["GioiTinhDG"].ToString();
                    dataGridViewDSDocGia.Rows[n].Cells[3].Value = dr["NgaySinhDG"].ToString();
                    dataGridViewDSDocGia.Rows[n].Cells[4].Value = dr["EmailDG"].ToString();
                    dataGridViewDSDocGia.Rows[n].Cells[5].Value = dr["DiaChiDG"].ToString();
                    dataGridViewDSDocGia.Rows[n].Cells[6].Value = dr["GhiChu"].ToString();
                    dataGridViewDSDocGia.Rows[n].Cells[7].Value = dr["TenTaiKhoanDG"].ToString();
                    dataGridViewDSDocGia.Rows[n].Cells[8].Value = dr["MatKhauDG"].ToString();
                }
            }
        }
        // Load
        private void frmQLDocGia_Load(object sender, EventArgs e)
        {
            LoadData();
            setControls(false);
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
            txtMaDG.Enabled = false;           
        }

        // Phương thức hiển thị các thuộc tính bảng Độc Giả lên txt
        public string maDG, tenDG, gioiTinhDG, ngaySinhDG, diaChiDG, sdtDG, loaiDG, ghiChu, tenTK, mK, NgLapThe;
        private void dataGridViewDSDocGia_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        // Phương thức tăng mã DG tự động
       

        // Phương thức thêm ĐG
        public int xuly;
        public void setNull()
        {
            txtMaDG.Text = "";
            txtTenDG.Text = "";
            txtEmail.Text = "";
            txtDiaChi.Text = "";
            cboGioiTinh.Text = "";
            dtmNgaySinh.Text = "";
            txtGhiChu.Text = "";
            txtTenTK.Text = "";
            txtMK.Text = "";
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            setControls(true);
            setNull();
            txtTenDG.Focus();
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnThem.Enabled = false;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
            xuly = 0;
        }

        // Phương thức sửa thông tin độc giả
        private void suaDG()
        {
            setControls(true);
            btnXoa.Enabled = false;
            btnSua.Enabled = false;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
            btnThem.Enabled = false;
            txtTenDG.Focus();
            xuly = 1;
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            suaDG();
        }

        private void dataGridViewDSDocGia_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaDG.Text = dataGridViewDSDocGia.CurrentRow.Cells[0].Value.ToString();
            txtTenDG.Text = dataGridViewDSDocGia.CurrentRow.Cells[1].Value.ToString();
            cboGioiTinh.Text = dataGridViewDSDocGia.CurrentRow.Cells[2].Value.ToString();
            dtmNgaySinh.Text = dataGridViewDSDocGia.CurrentRow.Cells[3].Value.ToString();
            txtEmail.Text = dataGridViewDSDocGia.CurrentRow.Cells[4].Value.ToString();
            txtDiaChi.Text = dataGridViewDSDocGia.CurrentRow.Cells[5].Value.ToString();
            txtGhiChu.Text = dataGridViewDSDocGia.CurrentRow.Cells[6].Value.ToString();
            txtTenTK.Text = dataGridViewDSDocGia.CurrentRow.Cells[7].Value.ToString();
            txtMK.Text = dataGridViewDSDocGia.CurrentRow.Cells[8].Value.ToString();
        }

        private void dataGridViewDSDocGia_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        // Phương thức xóa độc giả
        private void xoaDG()
        {
            DialogResult dlr;
            dlr = MessageBox.Show("Bạn chắc chắn muốn xóa.", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dlr == DialogResult.Yes)
            {
                try
                {
                    string query = "delete from tblDocGia where MaDG='" + txtMaDG.Text + "'";
                    var status = common.thucthidulieu(query);
                    if (status)
                    {
                        MessageBox.Show("Xóa thành công.", "Thông Báo");
                    }
                    else
                    {
                        MessageBox.Show("Xóa thất bại.", "Thông Báo");
                    }
                    LoadData();
                    setNull();
                }
                catch (Exception)
                {
                    MessageBox.Show("Xóa thất bại.\nĐộc Giả này đang mượn sách.", "Thông Báo");
                }
            }
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            xoaDG();
        }
        // Lưu
        private void themDG()
        {
            try
            {
                string madocgia = common.tangMaTuDong("tblDocGia", "DG");
                string themdongsql = "insert into tblDocGia(MaDG,TenDG,GioiTinhDG,NgaySinhDG,EmailDG,DiaChiDG,GhiChu,TenTaiKhoanDG,MatKhauDG) values ('" + madocgia + "'," +
                    "N'" + txtTenDG.Text + "'," +
                    "N'" + cboGioiTinh.Text + "'," +
                    "'" + dtmNgaySinh.Value.ToString("yyyy-MM-dd") + "'," +
                    "'" + txtEmail.Text + "'," +
                    "N'" + txtDiaChi.Text + "'," +
                    "N'" + txtGhiChu.Text + "'," +
                    "'" + txtTenTK.Text + "'," +
                    "'" + txtMK.Text + "')";
                common.thucthidulieu(themdongsql);
                MessageBox.Show("Thêm thành công.", "Thông Báo");
            }
            catch (Exception)
            {

            }
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            
            if (txtTenDG.Text == "")
            {
                errTenDG.SetError(txtTenDG, "Vui lòng nhập Tên DG");
            }
            else
            {
                errTenDG.Clear();
            }

            if (txtEmail.Text == "")
            {
                errEmail.SetError(txtEmail, "Vui lòng nhập Email");
            }
            else
            {
                errEmail.Clear();
            }

            if (txtDiaChi.Text == "")
            {
                errDC.SetError(txtDiaChi, "Vui lòng nhập Địa chỉ");
            }
            else
            {
                errDC.Clear();
            }

            if (txtTenTK.Text == "")
            {
                errTenTK.SetError(txtTenTK, "Vui lòng nhập Tên TK");
            }
            else
            {
                errTenTK.Clear();
            }

            if (txtMK.Text == "")
            {
                errMK.SetError(txtMK, "Vui lòng nhập MK");
            }
            else
            {
                errMK.Clear();
            }

            if (cboGioiTinh.Text == "")
            {
                errGT.SetError(cboGioiTinh, "Vui lòng chọn Giới Tính");
            }
            else
            {
                errGT.Clear();
            }
                    
            if(txtTenDG.Text.Length>0 && txtDiaChi.Text.Length>0  && dtmNgaySinh.Text.Length>0 && cboGioiTinh.Text.Length>0 && txtTenTK.Text.Length>0 && txtMK.Text.Length>0)
            {              
                int tuoiMin = 18;
                int tuoiMax = 30;// Convert.ToInt32(myCommand.ExecuteScalar());

                string[] nam = dtmNgaySinh.Text.Split('/');
                int NamSinh = Convert.ToInt32(nam[2]);
                int tuoi = DateTime.Now.Year - NamSinh;

                if (tuoi < tuoiMin || tuoi > tuoiMax)
                {
                    MessageBox.Show("Số tuổi không hợp lệ!");
                    return;
                }

                if (xuly==0)
                {
                    themDG();
                }
                else if(xuly==1)
                {
                    try
                    {
                        UpdataDatabase();
                       
                    }
                    catch
                    {
                        MessageBox.Show("Sửa thất bại.\nVui lòng kiểm tra lại dữ liệu.", "Thông Báo");
                    }
                }
                btnLuu.Enabled=false;
                btnHuy.Enabled=false;
                btnThem.Enabled=true;
                btnSua.Enabled=true;
                btnXoa.Enabled=true;
                setControls(false);
                LoadData();
                setNull();
            }
            else
            {
                MessageBox.Show("Vui lòng nhập đủ thông tin.", "Thông Báo");
                if (txtTenDG.Text.Length == 0)
                    txtTenDG.Focus();
                else if (txtDiaChi.Text.Length == 0)
                    txtDiaChi.Focus();
                else if (txtEmail.Text.Length == 0)
                    txtEmail.Focus();
                else if (txtTenTK.Text.Length == 0)
                    txtTenTK.Focus();
                else if (txtMK.Text.Length == 0)
                    txtMK.Focus();
            }
        }
        public void UpdataDatabase()
        {
            //txtMaTheLoai.ReadOnly = true;
            string qry = "Update tblDocGia set " +
                "TenDG =N'" + txtTenDG.Text + "', " +
                "GioiTinhDG =N'" + cboGioiTinh.Text + "', " +
                "NgaySinhDG ='" + dtmNgaySinh.Value.ToString("yyyy-MM-dd") + "', " +
                "EmailDG ='" + txtEmail.Text + "', " +
                "DiaChiDG =N'" + txtDiaChi.Text + "', " +
                "GhiChu =N'" + txtGhiChu.Text + "', " +
                "TenTaiKhoanDG ='" + txtTenTK.Text + "', " +
                "MatKhauDG ='" + txtMK.Text + "' " +
                " Where MaDG='" + txtMaDG.Text + "'";
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

        // Phương thức nút hủy
        private void btnHuy_Click(object sender, EventArgs e)
        {           
            setControls(true);
            LoadData();
            setNull();
            errMK.Clear();
            errEmail.Clear();
            errTenTK.Clear();
            errTenDG.Clear();
            errDC.Clear();
            errLoaiDG.Clear();
            errGT.Clear();
        }

        // Thoát form
        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        // Tìm kiếm 
        private void txtNDTimKiem_TextChanged(object sender, EventArgs e)
        {            
            if (radMaDG.Checked)
            {
                string timkiem = "select * from tblDocGia where MaDG like '%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiem);
            }
            else if (radTenDG.Checked)
            {
                string timkiem = "select * from tblDocGia where TenDG like N'%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiem);
            }
        }

        // Phương thức nút Load DS
        private void btnLoadDS_Click(object sender, EventArgs e)
        {
            setNull();
            setControls(false);
            LoadData();
        }

        private void txtMaDG_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
