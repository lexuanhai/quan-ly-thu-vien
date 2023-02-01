using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace QuanLyThuVien.Model
{
    public class Common
    {
        static string chuoiKetNoi = ConfigurationManager.ConnectionStrings["strConn"].ConnectionString;
        SqlConnection con = new SqlConnection(chuoiKetNoi);
        public void moketnoi()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
        public void dongketnoi()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        public Boolean thucthidulieu(string cmd)
        {
            moketnoi();
            Boolean check = false;
            try
            {
                SqlCommand sc = new SqlCommand(cmd, con);
                sc.ExecuteNonQuery();
                check = true;
            }
            catch (Exception)
            {
                check = false;
            }
            dongketnoi();
            return check;
        }
        public DataTable docdulieu(string cmd)
        {
            moketnoi();
            DataTable da = new DataTable();
            try
            {
                SqlCommand sc = new SqlCommand(cmd, con);
                SqlDataAdapter sda = new SqlDataAdapter(sc);
                sda.Fill(da);
            }
            catch (Exception)
            {
                da = null;
            }
            dongketnoi();
            return da;
        }
        public string tangMaTuDong(string table, string ma)
        {
            string cauTruyVan = "select * from " + table;
            DataTable dt = docdulieu(cauTruyVan);
            string maTuDong = ma;
            if (dt != null && dt.Rows.Count > 0)
            {
                string rowEnd = dt.Rows[dt.Rows.Count - 1][0].ToString();
                if (rowEnd.IndexOf(ma) >=0)
                {
                    string number = rowEnd.Substring(ma.Length);
                    int k = Convert.ToInt32(number);
                    k = k + 1;
                    if (k < 10)
                    {
                        maTuDong = maTuDong + "00";
                    }
                    else if (k < 100)
                    {
                        maTuDong = maTuDong + "0";
                    }
                    maTuDong = maTuDong + k.ToString();
                }
                else
                {
                    maTuDong = maTuDong + "001";
                }
                
            }
            else
            {
                maTuDong = maTuDong + "001";
            }
           
            //if (myTable.Rows.Count <= 0)
            //{
            //    maTuDong = "MS001";
            //}
            //else
            //{
            //    int k;
            //    maTuDong = "MS";
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
            return maTuDong;
            //return "";
        }
    }
    
}
