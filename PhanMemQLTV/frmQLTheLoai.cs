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
    public partial class frmQLTheLoai : Form
    {
        public frmQLTheLoai()
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
                dt = common.docdulieu("select * from tblTheLoai");
            }
            dataGVTheLoai.Rows.Clear();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int n = dataGVTheLoai.Rows.Add();
                    dataGVTheLoai.Rows[n].Cells[0].Value = dr["MaTheLoai"].ToString();
                    dataGVTheLoai.Rows[n].Cells[1].Value = dr["TenTheLoai"].ToString();
                    dataGVTheLoai.Rows[n].Cells[2].Value = dr["GhiChu"].ToString();
                    //dataGVTheLoai.Rows[n].Cells[3].Value = dr["Email"].ToString();
                    //dataGVTheLoai.Rows[n].Cells[4].Value = dr["Website"].ToString();
                    //dataGVTheLoai.Rows[n].Cells[5].Value = dr["DiaChi"].ToString();
                }
            }
        }

        // Phương thức thiết lập Controls
        private void setControls(bool edit)
        {
           // txtMaTheLoai.Enabled = edit;
            txtTenTheLoai.Enabled = edit;
            txtGhiChu.Enabled = edit;
        }

        public TheLoai GetValue()
        {
            var model = new TheLoai();
            model.MaTheLoai = txtMaTheLoai.Text;
            model.TenTheLoai = txtTenTheLoai.Text;
            model.GhiChu = txtGhiChu.Text;
            return model;
        }
        public void SetValue(TheLoai model)
        {
            txtMaTheLoai.Text = model.MaTheLoai;
            txtTenTheLoai.Text = model.TenTheLoai;
            txtGhiChu.Text = model.GhiChu;
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
            txtMaTheLoai.Focus();
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
            //txtMaTheLoai.Enabled = false;
        }

        //private void dataGridViewDSDocGia_CellClick(object sender, DataGridViewCellEventArgs e)
        //{
        //    txtMaTheLoai.Text = dataGVTheLoai.CurrentRow.Cells[0].Value.ToString();
        //    txtTenTheLoai.Text = dataGVTheLoai.CurrentRow.Cells[1].Value.ToString();            
        //    txtGhiChu.Text = dataGVTheLoai.CurrentRow.Cells[4].Value.ToString();
        //    txtDiaChi.Text = dataGVTheLoai.CurrentRow.Cells[5].Value.ToString();          
        //    txtSoDienThoai.Text = dataGVTheLoai.CurrentRow.Cells[8].Value.ToString();         
        //}

        //private void dataGVNSX_CellClick(object sender, DataGridViewCellEventArgs e)
        //{
        //    foreach (DataGridViewCell cell in dataGVTheLoai.SelectedCells)
        //    {
        //        //cell.RowIndex

        //        if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdMaNSX"].Value != null)
        //        {
        //            setControls(false);
        //            txtMaTheLoai.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdMaNSX"].Value.ToString();                    
        //        }
        //        if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdTen"].Value != null)
        //        {
        //            txtTenTheLoai.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdTen"].Value.ToString();
        //        }
        //        if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdSDT"].Value != null)
        //        {
        //            txtSoDienThoai.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdSDT"].Value.ToString();
        //        }
        //        if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdEmail"].Value != null)
        //        {
        //            txtGhiChu.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdEmail"].Value.ToString();
        //        }
        //        if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdWebsite"].Value != null)
        //        {
        //            txtWebsite.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdWebsite"].Value.ToString();
        //        }
        //        if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdDiaChi"].Value != null)
        //        {
        //            txtDiaChi.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdDiaChi"].Value.ToString();
        //        }               
        //    }
        //}

        //private void frmQLNhaXuatBan_Load(object sender, EventArgs e)
        //{
        //    LoadData();
        //    btnLuu.Enabled = false;
        //    btnHuy.Enabled = false;
        //}

        // Phương thức xóa độc giả
        private void Xoa()
        {
            if (!string.IsNullOrEmpty(txtMaTheLoai.Text))
            {
                DialogResult dlr;
                dlr = MessageBox.Show("Bạn chắc chắn muốn xóa.", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.Yes)
                {
                    try
                    {
                        string query = "DELETE FROM tblTheLoai WHERE MaTheLoai='" + txtMaTheLoai.Text + "'";
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
        //public bool Exist(string ma)
        //{
        //    if (!string.IsNullOrEmpty(ma))
        //    {

        //        //string query = "select * from tblTheLoai where IsDeteled = 0 and MaTheLoai ='" + ma +"'";
        //        string query = "DELETE FROM tblTheLoai WHERE MaTheLoai='" + ma + "'";

        //        DataTable dt = common.docdulieu(query);

        //        if (dt != null && dt.Rows.Count > 0)
        //        {
        //            return true;
        //        }
        //    }
        //    return false;
        //}

        // Lưu
        private void ThemMoi()
        {
            try
            {
                var model = GetValue();
                string ma = common.tangMaTuDong("tblTheLoai", "TheLoai");
                if (model != null && !string.IsNullOrEmpty(ma))
                {

                    var qry = "Insert into tblTheLoai(MaTheLoai, " +
               "TenTheLoai, " +
               "GhiChu, IsDeteled ) values('" + ma + "',N'" + model.TenTheLoai + "',N'" + model.GhiChu + "',0)";


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
            }
            catch (Exception)
            {
                MessageBox.Show("Thêm mới không thành công.");
            }
        }
        public void UpdataDatabase()
        {
            var model = GetValue();
            //txtMaTheLoai.ReadOnly = true;
            string qry = "Update tblTheLoai set " +
                "TenTheLoai =N'" + model.TenTheLoai + "', " +
                "GhiChu =N'" + model.GhiChu + "' " +
                " Where MaTheLoai='" + model.MaTheLoai + "'";
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

            if (txtTenTheLoai.Text == "")
            {
                errTenNhaSanXuat.SetError(txtTenTheLoai, "Vui lòng nhập Tên Thể Loại. ");
            }
            else
            {
                errTenNhaSanXuat.Clear();
            }

            if (txtTenTheLoai.Text.Length > 0)
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
                if (txtTenTheLoai.Text.Length == 0)
                    txtTenTheLoai.Focus();
            }
        }
        public void SetValueNull()
        {
            txtMaTheLoai.Text = "";
            txtTenTheLoai.Text = "";
            txtGhiChu.Text = "";
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
                string timkiem = "select * from tblTheLoai where MaTheLoai like '%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiem);
            }
            else if (radTenDG.Checked)
            {
                string timkiem = "select * from tblTheLoai where TenTheLoai like N'%" + txtNDTimKiem.Text + "%'";
                LoadData(timkiem);
            }
        }

        // Phương thức nút Load DS
        private void btnLoadDS_Click(object sender, EventArgs e)
        {
            //txtMaTheLoai.Enabled = false;
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

        private void dataGVTheLoai_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            foreach (DataGridViewCell cell in dataGVTheLoai.SelectedCells)
            {
                //cell.RowIndex

                if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdMaTheLoai"].Value != null)
                {
                    setControls(false);
                    txtMaTheLoai.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdMaTheLoai"].Value.ToString();
                }
                if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdTen"].Value != null)
                {
                    txtTenTheLoai.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdTen"].Value.ToString();
                }
                if (dataGVTheLoai.Rows[cell.RowIndex].Cells["tdGhiChu"].Value != null)
                {
                    txtGhiChu.Text = dataGVTheLoai.Rows[cell.RowIndex].Cells["tdGhiChu"].Value.ToString();
                }                
            }
        }

        private void frmQLTheLoai_Load(object sender, EventArgs e)
        {
            txtMaTheLoai.Enabled = false;
            setControls(false);
            LoadData();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
        }
    }
}
