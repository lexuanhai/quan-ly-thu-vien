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
    public partial class frmQLNhaXuatBan : Form
    {
        public frmQLNhaXuatBan()
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
                dt = common.docdulieu("select * from tblNhaXuatBan");
            }
            dataGVNSX.Rows.Clear();
            if (dt != null && dt.Rows.Count > 0)
            {
                dataGVNSX.Rows.Clear();
                foreach (DataRow dr in dt.Rows)
                {
                    int n = dataGVNSX.Rows.Add();
                    dataGVNSX.Rows[n].Cells[0].Value = dr["MaNXB"].ToString();
                    dataGVNSX.Rows[n].Cells[1].Value = dr["TenNXB"].ToString();
                    dataGVNSX.Rows[n].Cells[2].Value = dr["SoDienThoai"].ToString();
                    dataGVNSX.Rows[n].Cells[3].Value = dr["Email"].ToString();
                    dataGVNSX.Rows[n].Cells[4].Value = dr["Website"].ToString();
                    dataGVNSX.Rows[n].Cells[5].Value = dr["DiaChi"].ToString();
                }
            }
        }

        // Phương thức thiết lập Controls
        private void setControls(bool edit)
        {
            //txtMaNXB.Enabled = edit;
            txtTenNXB.Enabled = edit;
            txtDiaChi.Enabled = edit;
            txtEmail.Enabled = edit;
            txtSoDienThoai.Enabled = edit;
            txtWebsite.Enabled = edit;
        }

        public NhaSanXuat GetValue()
        {
            var model = new NhaSanXuat();
            model.MaNXB = txtMaNXB.Text;
            model.TenNXB = txtTenNXB.Text;
            model.SoDienThoai = txtSoDienThoai.Text;
            model.Email = txtEmail.Text;
            model.Website = txtWebsite.Text;
            model.DiaChi = txtDiaChi.Text;
            return model;
        }
        public void SetValue(NhaSanXuat model)
        {
            txtMaNXB.Text = model.MaNXB;
            txtTenNXB.Text = model.TenNXB;
            txtSoDienThoai.Text = model.SoDienThoai;
            txtEmail.Text = model.Email;
            txtWebsite.Text = model.Website;
            txtDiaChi.Text = model.DiaChi;
        }

        
       
        

        // Phương thức tăng mã DG tự động
        public string setMaDG()
        {
            //string cauTruyVan = "select * from tblDocGia";
            //dataGVNSX.DataSource = ketnoi(cauTruyVan);
            //dataGVNSX.AutoGenerateColumns = false;
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
            txtMaNXB.Focus();
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
            //txtMaNXB.Enabled = false;
        }

        private void dataGridViewDSDocGia_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaNXB.Text = dataGVNSX.CurrentRow.Cells[0].Value.ToString();
            txtTenNXB.Text = dataGVNSX.CurrentRow.Cells[1].Value.ToString();            
            txtEmail.Text = dataGVNSX.CurrentRow.Cells[4].Value.ToString();
            txtDiaChi.Text = dataGVNSX.CurrentRow.Cells[5].Value.ToString();          
            txtSoDienThoai.Text = dataGVNSX.CurrentRow.Cells[8].Value.ToString();         
        }

        private void dataGVNSX_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            foreach (DataGridViewCell cell in dataGVNSX.SelectedCells)
            {
                //cell.RowIndex

                if (dataGVNSX.Rows[cell.RowIndex].Cells["tdMaNSX"].Value != null)
                {
                    setControls(false);
                    txtMaNXB.Text = dataGVNSX.Rows[cell.RowIndex].Cells["tdMaNSX"].Value.ToString();                    
                }
                if (dataGVNSX.Rows[cell.RowIndex].Cells["tdTen"].Value != null)
                {
                    txtTenNXB.Text = dataGVNSX.Rows[cell.RowIndex].Cells["tdTen"].Value.ToString();
                }
                if (dataGVNSX.Rows[cell.RowIndex].Cells["tdSDT"].Value != null)
                {
                    txtSoDienThoai.Text = dataGVNSX.Rows[cell.RowIndex].Cells["tdSDT"].Value.ToString();
                }
                if (dataGVNSX.Rows[cell.RowIndex].Cells["tdEmail"].Value != null)
                {
                    txtEmail.Text = dataGVNSX.Rows[cell.RowIndex].Cells["tdEmail"].Value.ToString();
                }
                if (dataGVNSX.Rows[cell.RowIndex].Cells["tdWebsite"].Value != null)
                {
                    txtWebsite.Text = dataGVNSX.Rows[cell.RowIndex].Cells["tdWebsite"].Value.ToString();
                }
                if (dataGVNSX.Rows[cell.RowIndex].Cells["tdDiaChi"].Value != null)
                {
                    txtDiaChi.Text = dataGVNSX.Rows[cell.RowIndex].Cells["tdDiaChi"].Value.ToString();
                }               
            }
        }

        private void frmQLNhaXuatBan_Load(object sender, EventArgs e)
        {
            LoadData();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
        }

        // Phương thức xóa độc giả
        private void Xoa()
        {
            if (!string.IsNullOrEmpty(txtMaNXB.Text))
            {
                DialogResult dlr;
                dlr = MessageBox.Show("Bạn chắc chắn muốn xóa.", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.Yes)
                {
                    try
                    {
                        //string qry = "Update tblNhaXuatBan set " +
                        //   "IsDeteled = 1 " +
                        //   " Where MaNXB='" + txtMaNXB.Text + "'";
                        string qry = "DELETE FROM tblNhaXuatBan WHERE MaNXB='" + txtMaNXB.Text + "'";
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

                string query = "select * from tblNhaXuatBan IsDeteled = 0 and where MaNXB ='" + ma + "'";

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
                string ma = common.tangMaTuDong("tblNhaXuatBan", "NXB");
                var qry = "Insert into tblNhaXuatBan(MaNXB, " +
                   "TenNXB, " +
                   "SoDienThoai, " +
                   "Email, " +
                   "DiaChi, " +
                   "Website, " +
                   "IsDeteled ) values('" + ma + "',N'" + model.TenNXB + "','" + model.SoDienThoai + "','" + model.Email + "',N'" + model.DiaChi + "','" + model.Website + "',0)";


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
            txtMaNXB.ReadOnly = true;
            string qry = "Update tblNhaXuatBan set " +
                "TenNXB =N'" + model.TenNXB + "', " +
                "SoDienThoai ='" + model.SoDienThoai + "', " +
                "Email ='" + model.Email + "'," +
                "DiaChi =N'" + model.DiaChi + "'," +
                "Website ='" + model.Website + "'" +
                " Where MaNXB='" + model.MaNXB + "'";
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

            if (txtTenNXB.Text == "")
            {
                errTenNhaSanXuat.SetError(txtTenNXB, "Vui lòng nhập Tên Nhà Xuất Bản ");
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

            //if (txtMK.Text == "")
            //{
            //    errMK.SetError(txtMK, "Vui lòng nhập MK");
            //}
            //else
            //{
            //    errMK.Clear();
            //}

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
                txtTenNXB.Text.Length > 0 && 
                txtDiaChi.Text.Length > 0 &&
                txtEmail.Text.Length > 0 &&
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
                //dataGVNSX.Enabled = true;
            }
            else
            {
                MessageBox.Show("Vui lòng nhập đủ thông tin.", "Thông Báo");
                if (txtTenNXB.Text.Length == 0)
                    txtTenNXB.Focus();
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
            txtMaNXB.Text = "";
            txtTenNXB.Text = "";
            txtEmail.Text = "";
            txtDiaChi.Text = "";
            txtWebsite.Text = "";
            txtSoDienThoai.Text = "";
            //txtMaNXB.Enabled = true;
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
            //dataGVNSX.Enabled = true;
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
                string timkiem = "select * from tblNhaXuatBan where MaNXB like '%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiem);
            }
            else if (radTenDG.Checked)
            {
                string timkiem = "select * from tblNhaXuatBan where TenNXB like N'%" + txtNDTimKiem.Text + "%'";
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
    }
}
