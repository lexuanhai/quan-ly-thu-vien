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
using System.Collections;
using System.Reflection;

namespace PhanMemQLTV
{
    public partial class frmQLTacGia : Form
    {
        public frmQLTacGia()
        {
            InitializeComponent();
        }

        public int xuly;
        Common common = new Common();

        public void LoadData(string query ="")
        {
            DataTable dt;
            if (!string.IsNullOrEmpty(query))
            {
                dt = common.docdulieu(query);
            }
            else
            {
                dt = common.docdulieu("select * from tblTacGia");
            }
            dataGVTacGia.Rows.Clear();
            if (dt != null && dt.Rows.Count > 0)
            {
                dataGVTacGia.Rows.Clear();
                foreach (DataRow dr in dt.Rows)
                {
                    int n = dataGVTacGia.Rows.Add();
                    dataGVTacGia.Rows[n].Cells[0].Value = dr["MaTacGia"].ToString();
                    dataGVTacGia.Rows[n].Cells[1].Value = dr["TenTG"].ToString();
                    dataGVTacGia.Rows[n].Cells[2].Value = dr["NgaySinh"].ToString();
                    dataGVTacGia.Rows[n].Cells[3].Value = dr["SoDienThoai"].ToString();
                    dataGVTacGia.Rows[n].Cells[4].Value = dr["Email"].ToString();
                    dataGVTacGia.Rows[n].Cells[5].Value = dr["DiaChi"].ToString();
                }
            }
        }

        // Phương thức thiết lập Controls
        private void setControls(bool edit)
        {
            //txtMaTacGia.Enabled = edit;
            txtTenTacGia.Enabled = edit;
            txtDiaChi.Enabled = edit;
            txtEmail.Enabled = edit;
            txtSoDienThoai.Enabled = edit;
            dtNgaySinh.Enabled = edit;
        }

        public TacGia GetValue()
        {
            var model = new TacGia();
            model.MaTaGia = txtMaTacGia.Text;
            model.TenTaGia = txtTenTacGia.Text;
            model.SoDienThoai = txtSoDienThoai.Text;
            model.Email = txtEmail.Text;
            model.NgaySinh = dtNgaySinh.Value;
            model.DiaChi = txtDiaChi.Text;
            return model;
        }
        public void SetValue(TacGia model)
        {
            txtMaTacGia.Text = model.MaTaGia;
            txtTenTacGia.Text = model.TenTaGia;
            txtSoDienThoai.Text = model.SoDienThoai;
            txtEmail.Text = model.Email;
            if (model.NgaySinh.HasValue && !string.IsNullOrEmpty(model.NgaySinh.Value.ToString()))
            {
                dtNgaySinh.Value = model.NgaySinh.Value;
            }
           
            txtDiaChi.Text = model.DiaChi;
        }

        // Phương thức tăng mã DG tự động
        public string setMaDG()
        {
            //string cauTruyVan = "select * from tblDocGia";
            //dataGVTacGia.DataSource = ketnoi(cauTruyVan);
            //dataGVTacGia.AutoGenerateColumns = false;
            //myConnection.Close();
            //string maTuDong = "";
            //if (myTable.Rows.Count <= 0)
            //{
            //    maTuDong = "DG001";
            //}
            //else
            //{
            //    int k;
            //    maTuDong = "DG";
            //    k = Convert.ToInt32(myTable.Rows[myTable.Rows.Count - 1][0].ToString().Substring(2, 3));
            //    k = k + 1;
            //    if (k < 10)
            //    {
            //        maTuDong = maTuDong + "00";
            //    }
            //    else if (k < 100)
            //    {
            //        maTuDong = maTuDong + "0";
            //    }
            //    maTuDong = maTuDong + k.ToString();
            //}
            //return maTuDong;
            return "";
        }

        
        private void btnThem_Click(object sender, EventArgs e)
        {
            setControls(true);
            //txtMaNXB.Text = setMaDG();
            SetValueNull();         
            txtMaTacGia.Focus();
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
            xuly = 1;
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            suaDG();
            //txtMaTacGia.Enabled = false;
        }

        // Phương thức xóa độc giả
        private void Xoa()
        {
            if (!string.IsNullOrEmpty(txtMaTacGia.Text))
            {
                DialogResult dlr;
                dlr = MessageBox.Show("Bạn chắc chắn muốn xóa.", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.Yes)
                {
                    try
                    {
                        //string qry = "Update tblTacGia set " +
                        //   "IsDeteled = 1 " +
                        //   " Where MaTacGia='" + txtMaTacGia.Text + "'";
                        string qry = "DELETE FROM tblTacGia WHERE MaTacGia='" + txtMaTacGia.Text + "'";
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
                MessageBox.Show("Vui lòng chọn mã nhà sản xuất.", "Thông Báo");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            Xoa();
        }
        public bool Exist(string ma)
        {
            if (!string.IsNullOrEmpty(ma))
            {

                string query = "select * from tblTacGia where IsDeteled = 0 and MaTacGia ='" + ma + "'";

                DataTable dt = common.docdulieu(query);

                if (dt != null && dt.Rows.Count > 0)
                {
                    return true;
                }
            }
            return false;
        }

        // Lưu
        private void ThemMoi()
        {
            try
            {
                var model = GetValue();
                string ma = common.tangMaTuDong("tblTacGia", "TG");
                var qry = "Insert into tblTacGia(MaTacGia, " +
                  "TenTG, " +
                  "SoDienThoai, " +
                  "Email, " +
                  "DiaChi, " +
                  "NgaySinh, " +
                  "IsDeteled ) values('" + ma + "',N'" + model.TenTaGia + "','" + model.SoDienThoai + "','" + model.Email + "',N'" + model.DiaChi + "','" + model.NgaySinh + "',0)";


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
            //txtMaTacGia.ReadOnly = true;
            string qry = "Update tblTacGia set " +
                "TenTG =N'" + model.TenTaGia + "', " +
                "SoDienThoai ='" + model.SoDienThoai + "', " +
                "Email ='" + model.Email + "'," +
                "DiaChi =N'" + model.DiaChi + "'," +
                "NgaySinh ='" + model.NgaySinh + "'" +
                " Where MaTacGia='" + model.MaTaGia + "'";
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
        private void btnLuu_Click(object sender, EventArgs e)
        {

            if (txtTenTacGia.Text == "")
            {
                errTenNhaSanXuat.SetError(txtTenTacGia, "Vui lòng nhập Tên Nhà Xuất Bản ");
            }
            else
            {
                errTenNhaSanXuat.Clear();
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

            if (txtSoDienThoai.Text == "")
            {
                errTenTK.SetError(txtSoDienThoai, "Vui lòng nhập Tên TK");
            }
            else
            {
                errTenTK.Clear();
            }

            if (dtNgaySinh.Text == "")
            {
                errMK.SetError(dtNgaySinh, "Vui lòng nhập MK");
            }
            else
            {
                errMK.Clear();
            }

            //if (cboGioiTinh.Text == "")
            //{
            //    errGT.SetError(cboGioiTinh, "Vui lòng chọn Giới Tính");
            //}
            //else
            //{
            //    errGT.Clear();
            //}

            //if (cboLoaiDG.Text == "")
            //{
            //    errLoaiDG.SetError(cboLoaiDG, "Vui lòng nhập Loại ĐG");
            //}
            //else
            //{
            //    errLoaiDG.Clear();
            //}


            if (
                txtTenTacGia.Text.Length > 0 && 
                txtDiaChi.Text.Length > 0 &&
                txtEmail.Text.Length > 0 &&
                dtNgaySinh.Text.Length > 0 &&
                txtSoDienThoai.Text.Length > 0)
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
                //dataGVTacGia.Enabled = true;
            }
            else
            {
                MessageBox.Show("Vui lòng nhập đủ thông tin.", "Thông Báo");
                if (txtTenTacGia.Text.Length == 0)
                    txtTenTacGia.Focus();
                else if (txtDiaChi.Text.Length == 0)
                    txtDiaChi.Focus();
                else if (txtEmail.Text.Length == 0)
                    txtEmail.Focus();
                else if (txtSoDienThoai.Text.Length == 0)
                    txtSoDienThoai.Focus();
            }
        }
        public void SetValueNull()
        {
            txtMaTacGia.Text = "";
            txtTenTacGia.Text = "";
            txtEmail.Text = "";
            txtDiaChi.Text = "";
            dtNgaySinh.Text = "";
            txtSoDienThoai.Text = "";
            //txtMaTacGia.Enabled = true;
        }
        // Phương thức nút hủy
        private void btnHuy_Click(object sender, EventArgs e)
        {

            SetValueNull();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            setControls(false);
            //dataGVTacGia.Enabled = true;
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
            search();
        }
        public void search()
        {
            btnThem.Enabled = false;
            if (radMaDG.Checked)
            {
                string timkiem = "select * from tblTacGia where MaTacGia like '%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiem);
            }
            else if (radTenDG.Checked)
            {
                string timkiem = "select * from tblTacGia where TenTG like N'%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiem);
            }
        }

        // Phương thức nút Load DS
        private void btnLoadDS_Click(object sender, EventArgs e)
        {
            lblNhapTenDG.Text = "";
            lblNhapGioiTinh.Text = "";
            lblNhapDiaChi.Text = "";
            setControls(false);
            txtNDTimKiem.Text = "";
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;

            LoadData();
        }

        private void dataGVTacGia_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            foreach (DataGridViewCell cell in dataGVTacGia.SelectedCells)
            {
                //cell.RowIndex

                if (dataGVTacGia.Rows[cell.RowIndex].Cells["tdMaTG"].Value != null)
                {
                    setControls(false);
                    txtMaTacGia.Text = dataGVTacGia.Rows[cell.RowIndex].Cells["tdMaTG"].Value.ToString();
                }
                if (dataGVTacGia.Rows[cell.RowIndex].Cells["tdTen"].Value != null)
                {
                    txtTenTacGia.Text = dataGVTacGia.Rows[cell.RowIndex].Cells["tdTen"].Value.ToString();
                }
                if (dataGVTacGia.Rows[cell.RowIndex].Cells["tdSoDienThoai"].Value != null)
                {
                    txtSoDienThoai.Text = dataGVTacGia.Rows[cell.RowIndex].Cells["tdSoDienThoai"].Value.ToString();
                }
                if (dataGVTacGia.Rows[cell.RowIndex].Cells["tdEmail"].Value != null)
                {
                    txtEmail.Text = dataGVTacGia.Rows[cell.RowIndex].Cells["tdEmail"].Value.ToString();
                }
                if (dataGVTacGia.Rows[cell.RowIndex].Cells["tdNgaySinh"].Value != null)
                {
                    string ngaysinh = dataGVTacGia.Rows[cell.RowIndex].Cells["tdNgaySinh"].Value.ToString();
                    if (!string.IsNullOrEmpty(ngaysinh))
                    {
                        var dt = Convert.ToDateTime(ngaysinh);
                        dtNgaySinh.Value = dt;
                    }                   
                }
                if (dataGVTacGia.Rows[cell.RowIndex].Cells["tdDiaChi"].Value != null)
                {
                    txtDiaChi.Text = dataGVTacGia.Rows[cell.RowIndex].Cells["tdDiaChi"].Value.ToString();
                }
            }
        }

        private void frmQLTacGia_Load(object sender, EventArgs e)
        {
            txtMaTacGia.Enabled = false;
            setControls(false);
            LoadData();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
        }
    }
}
